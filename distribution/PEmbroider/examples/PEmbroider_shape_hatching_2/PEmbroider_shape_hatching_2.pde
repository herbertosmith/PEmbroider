// Test program for the PEmbroider library for Processing:
// Different methods for filling (hatching) shapes with PEmbroider: 
// * PEmbroiderGraphics.PERLIN
// * PEmbroiderGraphics.CROSS
// * PEmbroiderGraphics.DRUNK
// * PEmbroiderGraphics.VECFIELD

import processing.embroider.*;
PEmbroiderGraphics E;


void setup() {
  noLoop(); 
  size (500, 500);
  E = new PEmbroiderGraphics(this, width, height);

  String outputFilePath = sketchPath("PEmbroider_shape_hatching_2.vp3");
  E.setPath(outputFilePath); 
  E.beginDraw(); 
  E.clear();
  E.strokeWeight(1); 
  E.fill(0, 0, 0); 
  E.noStroke(); 


  //-----------------------
  E.HATCH_MODE = PEmbroiderGraphics.PERLIN;
  E.HATCH_SPACING = 4;
  E.HATCH_SCALE = 1.0;
  E.rect( 50, 50, 100, 100);

  E.HATCH_MODE = PEmbroiderGraphics.PERLIN;
  E.HATCH_SPACING = 8;
  E.HATCH_SCALE = 1.0;
  E.rect(200, 50, 100, 100);

  E.HATCH_MODE = PEmbroiderGraphics.PERLIN;
  E.HATCH_SPACING = 4;
  E.HATCH_SCALE = 4.5;
  E.rect(350, 50, 100, 100);


  //-----------------------
  // The "cross" hatch mode is a convenience mode, 
  // placing parallel lines of stitching at two orientations
  // specified by HATCH_ANGLE and HATCH_ANGLE2:
  E.HATCH_MODE = PEmbroiderGraphics.CROSS;
  E.HATCH_ANGLE = radians(90);
  E.HATCH_ANGLE2 = radians(0); 
  E.HATCH_SPACING = 4;
  E.circle(50, 200, 100);

  E.HATCH_MODE = PEmbroiderGraphics.CROSS;
  E.HATCH_ANGLE = radians(90); 
  E.HATCH_ANGLE2 = radians(75); 
  E.HATCH_SPACING = 8;
  E.circle(200, 200, 100);

  // The purpose of the "drunk walk" hatch mode is 
  // not necessarily to be useful in itself -- but rather
  // as a simple pedagogic example for how to make your
  // own hatch technique (in the PEmbroider source code), 
  // if you wanted to extend the PEmbroider library. 
  E.HATCH_MODE = PEmbroiderGraphics.DRUNK;
  E.circle(350, 200, 100);


  //-----------------------
  // The VECFIELD hatch mode allows you to create a 
  // user-defined vector field, with a function that 
  // returns a 2D vector indicating the local orientation
  // of stitches at any given point (x,y). 
  // See the MyVecField class below.
  MyVecField mvf = new MyVecField();
  E.HATCH_MODE = PEmbroiderGraphics.VECFIELD;
  E.HATCH_VECFIELD = mvf;
  E.HATCH_SPACING = 4;
  E.ellipse ( 50, 350, 400, 100);


  //-----------------------
  E.visualize();
  E.optimize(); // slow, but good and important
  E.endDraw(); // write out the file
}


//--------------------------------------------
class MyVecField implements PEmbroiderGraphics.VectorField {
  public PVector get(float x, float y) {
    x*=0.05;
    return new PVector(1, 0.5*sin(x));
  }
}


//--------------------------------------------
void draw() {
  ;
}