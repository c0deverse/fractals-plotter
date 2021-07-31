void plotJulia(float xMin, float yMin, float range, float radius, Complex c) {
  Scale jXScale = new Scale(xMin, xMin + range);
  Scale jYScale = new Scale(yMin, yMin + range);

  for (int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      Complex Zn = new Complex(jXScale.mapIn(x, width), jYScale.mapIn(y, height));
      int nIterations = 0;

      while (Zn.absSquared() < radius*radius && nIterations < MAX_ITERATIONS) {
        Zn = Zn.mult(Zn).add(c);
        nIterations += 1;
      }

      pixels[x+y*width] = bwColor(nIterations);
    }
  }
}
