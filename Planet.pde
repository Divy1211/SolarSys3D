class Planet {
  PVector pos = new PVector(), v = new PVector(1, 0, 1), axis;
  Planet m[];
  int l,re,g,b;
  float z, r, d, a = random(TAU),os = random(-0.04,0.04);
  Planet(float x, float y, float z, float radius) {
    pos.x = x;
    pos.y = y;
    pos.z = z;
    re = (int)random(255);
    g = (int)random(255);
    b = (int)random(255);
    l = 0;
    r = radius;
    axis = pos.cross(v);
  }
  void showMoons(int no, int l) {
    m = new Planet[no];
    int i = 0;
    this.l = l-1;
    if(this.l == 0) {
      int c = (int)random(2);
      if(c < 1) {
        re = 255;
        g = 255;
        b = 0;
      }
      else {
        re = 255;
        g = 0;
        b = 0;
      }
    }
    pushMatrix();
    if (l <= 2) {
      while (i < no) {
        translate(pos.x, pos.y, pos.z);
        PVector p = PVector.random3D();
        float ra = r/(l*2);
        float d = random(200,500)/(l*2);
        p.mult(d);
        m[i] = new Planet(p.x, p.y, p.z, ra);
        m[i].showMoons(int(random(0,3)),l+1);
        i++;
      }
    }
    popMatrix();
  }
  void show() {
    pushMatrix();
    rotate(a, axis.x, axis.y, axis.z);
    translate(pos.x, pos.y, pos.z);
    lights();
    fill(re,g,b);
    sphere(r);
    int i = 0;
    while(i < m.length) {
      if(m[i] != null) {
        m[i].show();
      }
      i++;
    }
    a+=os;
    popMatrix();
  }
}
