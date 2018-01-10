class button {
  int x, y, w, h, round;
  String label;

  button(int x, int y, int w, int h, int round, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.round = round;
    this.label = label;
  }

  void display() {
    if (hover()==false) {
      noStroke();
      fill(#2980b9);
    }
    if (hover()) {
      stroke(#8bc6ec);
      fill(#51a0d4);
    }
    rect(x, y, w, h, round);
    fill(255);
    textSize(h/1.8);
    text(label, x+w/3.8, y+h/1.4);
  }

  boolean hover() {
    if (mouseX > x && mouseX < x+w) {
      if (mouseY > y && mouseY < y+h) {
        return true;
      }
    }
    return false;
  }
}

//------------------------------------------------------------------------------
class pnt {
  int x, y, r;
  Person o;
  color col;

  pnt(int x, int y, int r, Person o, color col) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.o = o;
    this.col = col;
  }

  void display() {
    if (hover()==false) {
      noStroke();
      fill(col, col, col);
    }
    if (hover()) {
      stroke(255);
      fill(col, col, col);
    }
    ellipse(x, y, r, r);
  }

  boolean hover() {
    if (dist(mouseX, mouseY, x, y) < r) {
      return true;
    }
    return false;
  }
}

//-------------------------------------------------
class dotMap {
  int x, y, w, h;

  dotMap(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  void load() {
    for (int i = y; i<h; i+=h/12) {
      for (int j = x; j<w+(w/52); j+=w/51) {
        points.add(new pnt(j, i, 10, people.get(0), #ffffff));
      }
    }
  }
  void display() {
    for (pnt p : points) {
      p.display();

      if (p.hover()) {
        fill(0);
        text(p.o.name + "\n" + p.o.date + "\n" + p.o.age + "\n" + p.o.address, p.x, p.y-50);
        if (mousePressed) {
          p.col = #27ae60;
        }
      }
    }
  }
}

//------------------------------
class lineGraph {

  void display() {
  }
}

class barGraph {
  void display() {
  }
}