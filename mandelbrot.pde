void plotMandelbrot(float xMin, float yMin, float range) {
  Scale mbXScale = new Scale(xMin, xMin + range);
  Scale mbYScale = new Scale(yMin, yMin + range);

  for (int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      Complex c = new Complex(mbXScale.mapIn(x, width), mbYScale.mapIn(y, height));
      Complex Zn = new Complex(c);
      int nIterations = 0;

      while (Zn.absSquared() < 4 && nIterations < MAX_ITERATIONS) {
        Zn = Zn.mult(Zn).add(c);
        nIterations += 1;
      }

      pixels[x+y*width] = bwColor(nIterations);

    }
  }
}
