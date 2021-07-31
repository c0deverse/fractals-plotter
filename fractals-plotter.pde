/*
Help:
  Use 'j' and 'm' to switch between Julia and Mandelbrot modes respectively.
  Use 'z' to toggle zoom mode.
  Use 'r' to reset zoom.
  Use mouse to navigate.
  While in zoom mode, use left mouse button to select a zone to zoom in.
  In Julia mode:
    Use 'Arrow Right/Left' to change the value of the real part of C
    Use 'Arrow Up/Down' to change the value of the imaginary part of C
*/



int MAX_ITERATIONS = 100;
int JULIA_MODE = 0;
int MANDELBROT_MODE = 1;

int mode = JULIA_MODE;
float xMin = -2.4, yMin = -1, range = 4;
float originX, originY, startX, startY, endX, endY;
boolean  zooming = false, zoomMode = false;
// for Julia Zc
float rr = 0, ri = 0, dr = 0.01;


void setup() {
  background(0);
  size(400, 400);
  surface.setTitle("Julia and Mandelbrot Sets Plotter");
}

void draw() {

  loadPixels();
  if (mode == JULIA_MODE) plotJulia(xMin, yMin, range, 1000, new Complex(rr, ri));
  if (mode == MANDELBROT_MODE) plotMandelbrot(xMin, yMin, range);
  updatePixels();

  // displaying the value of Zc
  if (mode == JULIA_MODE) {
    fill(color(0));
    text(String.format("( %.2f, %.2f )", rr, ri), 10, 10);
  }
  if (zooming) drawZoomRectangle();
}
