class Complex {
  // all methods are considered to be static!
  float real, imag;

  Complex () {
    this.real = 0;
    this.imag = 0;
  }

  Complex(float r, float i) {
    this.real = r;
    this.imag = i;
  }

  Complex(Complex c) {
    this.real = c.real;
    this.imag = c.imag;
  }

  Complex add(Complex c) {
    float r = this.real + c.real;
    float i = this.imag + c.imag;
    return new Complex(r, i);
  }

  Complex mult(Complex c) {
    float r = c.real * this.real - this.imag*c.imag;
    float i = this.real*c.imag + this.imag*c.real;
    return new Complex(r, i);
  }

  Complex toPow(float n) {
    float r = pow((real*real + imag*imag), n/2);
    r *= cos(n * atan2(imag, real));
    float i = pow((real*real + imag*imag), n/2);
    i *= sin(n * atan2(imag, real));
    return new Complex(r, i);
  }

  float abs() {
    return sqrt(this.absSquared());
  }

  float absSquared() {
    return (this.real*this.real) + (this.imag*this.imag);
  }
}
