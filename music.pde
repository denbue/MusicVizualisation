
import ddf.minim.*;
 
Minim minim;
 
// AudioPlayer input;
AudioInput input;
AudioRenderer iso;

int colorback = 0;
  
void setup()
{
  // setup graphics
  size(displayWidth, displayHeight, P3D);
     
  // setup player
  minim = new Minim(this);
  input = minim.getLineIn (Minim.STEREO, 512);
 
  // setup renderers
  iso = new IsometricRenderer(input);
  input.addListener(iso);
  iso.setup();
}
void draw()
{
  background(0);
  iso.draw();
}

void keyPressed() {
   switch(key) {
      case('a'): colorback = 255; break;
   }
   // fill(colorback);
   // rect(0,0,width,height);
   background(colorback);
}

void keyReleased() {
  colorback = 0;
}

 
void stop()
{
  input.close();
  minim.stop();
  super.stop();
}

