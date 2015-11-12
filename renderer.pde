 
class IsometricRenderer extends FourierRenderer {
  
  
  // Setup - feel free to change
  
  // Change modes ("3d", "bars", "lines")
  String mode = "bars";
  // Default colors without disco effect
  float red = 255; float green = 36; float blue = 104;
  // Do you want the Disco effect?
  boolean disco = false;
  // How fast should the color change? fast = blink, slow = fade
  float discoSpeed = 0.01;
  
  
  // Please change nothing here
  float redNoise = 200, greenNoise = 220, blueNoise = 250;
  int r = 3;
  float squeeze = .4; 
  float dimension;
  float a, d;
  float val[];
  int n;
   
  IsometricRenderer(AudioSource source) {
    super(source);
    n = ceil(sqrt(2) * r + 50);
    d = min(width,height) / r / 4;
    val = new float[n];
  }
 
  void setup() {
    
  }
   
  void draw() {
    
    background(0);
    
    if(disco == true) {
      
      red = noise(redNoise)*255;
      green = noise(greenNoise)*255;
      blue = noise(blueNoise)*255;
      redNoise += discoSpeed;
      greenNoise += discoSpeed;
      blueNoise += discoSpeed;
    
    }
    
    if(mode == "3d") {
     
      dimension = .4;
      
    }
    else {
      
      dimension = 0;
      
    }
     
    if(left != null) {
      
      super.calc(n);
       
      // actual values react with a delay
      for(int i=0; i<n; i++) val[i] = lerp(val[i], pow(leftFFT[i], squeeze), .1);
      
      // calculate + draw iso
      for (int x = -r; x <= r; x++) {
        for (int z = -r; z <= r; z++) {
          int y = int( height/9 * val[(int) dist(x,z,0,0)]);
   
          float xm = x*d - d/4;
          float xt = x*d + d/4;
          float zm = z*d - d/4;
          float zt = z*d + d/4;
          
          // Position
          int w0 = (int) width * 5/10;
          int h0 = (int) height * 6/10;
   
          int isox1 = int(xm - zm + w0);
          int isoy1 = int((xm + zm) * dimension + h0);
          int isox2 = int(xm - zt + w0);
          int isoy2 = int((xm + zt) * dimension + h0);
          int isox3 = int(xt - zt + w0);
          int isoy3 = int((xt + zt) * dimension + h0);
          int isox4 = int(xt - zm + w0);
          int isoy4 = int((xt + zm) * dimension + h0);
          
          
          if (mode == "3d") {
            noStroke();
            // left
            fill(red, green, blue, 255*0.6);
            quad(isox2, isoy2-y, isox3, isoy3-y, isox3, isoy3+d, isox2, isoy2+d);
            // right
            fill(red, green, blue, 255*0.4);
            quad(isox3, isoy3-y, isox4, isoy4-y, isox4, isoy4+d, isox3, isoy3+d);
            // head
            fill(red, green, blue, 255);
            quad(isox1, isoy1-y, isox2, isoy2-y, isox3, isoy3-y, isox4, isoy4-y);
          }
          
          if (mode == "bars") {
            noStroke();
            fill(red, green, blue, 255*0.2);
            quad(isox2, isoy2-y, isox3, isoy3-y, isox3, isoy3+d, isox2, isoy2+d);
          }
          
          if (mode == "lines") {
            noFill();
            stroke(red,green,blue,255*.2);
            strokeWeight(5);
            line(isox1-y, 0, isox1-y, height);
          }     
          
        }
      }
    }
  }
 
}