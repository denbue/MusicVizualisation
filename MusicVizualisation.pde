// 2d + 3d Isometric audio visualization


// NOTES:
// - Important: Optimized only for 1080p, lower resoulutions could have problems
// - Start in fullscreen with ctrl+shift+r
// - Sketch will use system default audio input, if you have problems check your default audio input and gain
// - Quality depends of course on your input
// - For settings have a look at the "renderer.pde"

import ddf.minim.*;
 
Minim minim;
AudioInput input;
AudioRenderer iso;
  
void setup()
{
  // setup graphics
  size(displayWidth, displayHeight, P3D);
     
  // setup player
  minim = new Minim(this);
  input = minim.getLineIn (Minim.STEREO, 512);
 
  // setup renderer
  iso = new IsometricRenderer(input);
  input.addListener(iso);
  iso.setup();
}

void draw()
{
  iso.draw();
}

 
void stop()
{
  input.close();
  minim.stop();
  super.stop();
}



