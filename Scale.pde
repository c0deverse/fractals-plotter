class Scale {
  float start;
  float end;

  Scale(float s, float e) {
    this.start = s;
    this.end = e;
  }

  float mapIn(float x, float xStart, float xEnd) {
    return map(x, xStart, xEnd, this.start, this.end);
  } 

  // same as mapIn, just assumes that xStart is 0
  float mapIn(float x, float xEnd) {
    return this.mapIn(x, 0, xEnd);
  }
}
