Planet sun = new Planet(0, 0, 0, 50);
void setup() {
  size(700, 700, P3D);
  background(0);
  noStroke();
  sun.showMoons(5, 1);
}
void draw() {
  background(0);
  translate(width/2, width/2);
  sun.show();
}
