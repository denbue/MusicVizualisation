MusicVizualisation (Processing)
==================

The visualization works in real time with any audio input and displays the sound spectrum in three different modes. All settings can be accessed via renderer.pde:

```
// Setup - feel free to change
// Change modes („3d“, „bars“, „lines“)
String mode = „lines“;
// Default colors without disco effect
float red = 255; float green = 36; float blue = 104;
// Do you want the Disco effect?
boolean disco = false;
// How fast should the color change? fast = blink, slow = fade
float discoSpeed = 0.01;
```

![](https://github.com/denbue/MusicVizualisation/master/images-for-documentation/3d.png)
![](https://github.com/denbue/MusicVizualisation/master/images-for-documentation/bars.png)
![](https://github.com/denbue/MusicVizualisation/master/images-for-documentation/lines.png)


NOTES:
- Important: Optimized only for 1080p, lower resoulutions could have problems
- Start in fullscreen with ctrl+shift+r
- Sketch will use system default audio input, if you have problems check your default audio input and level
- Quality depends of course on your input
- For settings have a look at the „renderer.pde“


For Information visit http://www.dennisbuecker.de
