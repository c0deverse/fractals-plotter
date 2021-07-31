import java.awt.Color;

color bwColor(int nIterations) {
  return color((int) (255 - map(nIterations % 255, 0, MAX_ITERATIONS, 0, 255)));
}

color palletteColor(int nIterations) {
  // https://stackoverflow.com/questions/369438/smooth-spectrum-for-mandelbrot-set-rendering
  return Color.HSBtoRGB(nIterations/256f, 1.f, nIterations/(nIterations+8f));
}

void drawZoomRectangle() {
  stroke(color(255, 0, 0));
  line(startX, startY, mouseX, startY);
  line(startX, startY, startX, mouseY);
  line(startX, mouseY, mouseX, mouseY);
  line(mouseX, startY, mouseX, mouseY);
}


void mousePressed() {
  startX = mouseX;
  startY = mouseY;

  originX = xMin;
  originY = yMin;

  zooming = true && zoomMode;
}

void mouseReleased() {
  endX = mouseX;
  endY = mouseY;

  if (zoomMode) {
    xMin = map(startX, 0, width, xMin, xMin + range);
    yMin = map(startY, 0, height, yMin, yMin + range);
    range = map(abs(startX - endX), 0, width, 0, range);

    zooming = false;
  }
}

void mouseDragged(){
  float deltaX = (mouseX - startX) / width;
  float deltaY = (mouseY - startY) / height;

  if (!zoomMode) {
    xMin = originX - deltaX*range;
    yMin = originY - deltaY*range;
  }
}

void keyPressed() {
  if (key == 'z') zoomMode = !zoomMode;
  else if (key == 'r') {
    reset_zoom();
  }
  else if (key == 'm') {
    mode = MANDELBROT_MODE;
    reset_zoom();
  }
  else if (key == 'j') {
    mode = JULIA_MODE;
    reset_zoom();
  }
  if (key == CODED) {
    if (keyCode == RIGHT) rr += dr;
    if (keyCode == LEFT) rr -= dr;
    if (keyCode == DOWN) ri -= dr;
    if (keyCode == UP) ri += dr;
  }
}

void reset_zoom() {
    xMin = -2.4;
    yMin = -1;
    range = 10;
}
