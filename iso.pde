// the code for the isometric renderer was deliberately taken from Jared C.'s wavy sketch
// ( http://www.openprocessing.org/visuals/?visualID=5671 )
 
class IsometricRenderer extends FourierRenderer {
 
  int r = 3;
  float squeeze = .4;
  float colorSpeed = 0.005;
 
  float a, d;
  float val[];
  int n;
  
  // color
  float redNoise = 150, greenNoise = 100, blueNoise = 200;
  float red, green, blue;
   
  IsometricRenderer(AudioSource source) {
    super(source);
    n = ceil(sqrt(2) * r +20);
    d = min(width,height) / r / 3;
    val = new float[n];
  }
 
  void setup() {
    stroke(255, 36, 104);
    noStroke();
  }
   
  void draw() {
    
    red = noise(redNoise)*255;
    green = noise(greenNoise)*255;
    blue = noise(blueNoise)*255;
    redNoise += colorSpeed;
    greenNoise += colorSpeed;
    blueNoise += colorSpeed;
     
    if(left != null) {
      
      super.calc(n);
       
      // actual values react with a delay
      for(int i=0; i<n; i++) val[i] = lerp(val[i], pow(leftFFT[i], squeeze), .1);
       
      a -= 0.08;
      //background(0); 
      for (int x = -r; x <= r; x++) {
        for (int z = -r; z <= r; z++) {
          int y = int( height/9 * val[(int) dist(x,z,0,0)]);
   
          float xm = x*d - d/4;
          float xt = x*d + d/4;
          float zm = z*d - d/4;
          float zt = z*d + d/4;
   
          int w0 = (int) width * 5/10;
          int h0 = (int) height * 55/100;
   
          int isox1 = int(xm - zm + w0);
          int isoy1 = int((xm + zm) * 0.4 + h0);
          int isox2 = int(xm - zt + w0);
          int isoy2 = int((xm + zt) * 0.4 + h0);
          int isox3 = int(xt - zt + w0);
          int isoy3 = int((xt + zt) * 0.4 + h0);
          int isox4 = int(xt - zm + w0);
          int isoy4 = int((xt + zm) * 0.4 + h0);
          
          
          //fill(255, 36, 104);
          fill(red, green, blue, 255*0.8);
          quad(isox2, isoy2-y, isox3, isoy3-y, isox3, isoy3+d, isox2, isoy2+d);
          //fill(191, 27, 78);
          fill(red, green, blue, 255*0.6);
          quad(isox3, isoy3-y, isox4, isoy4-y, isox4, isoy4+d, isox3, isoy3+d);
          //fill(127, 18, 52);
          fill(red, green, blue, 255*0.4);
          quad(isox1, isoy1-y, isox2, isoy2-y, isox3, isoy3-y, isox4, isoy4-y);
        }
      }
    }
  }
 
}
