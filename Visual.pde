//------------------------------------------------------------------------------
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
    textSize(h/4);
    text(label, x+w/4, y+h/1.8);
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

  void toggleRange(int min, int max) {
    for (pnt p : points) {
      if (p.o.age > min && p.o.age < max) {
        p.col = #ffffff;
      }
    }
  }
}

//------------------------------------------------------------------------------
class dotMap {
  int x, y, w, h, count;

  dotMap(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  void load() {
    //the increment is 4 more than the actual size? works
    for (int i = y; i<=h; i+=h/16) {
      for (int j = x; j<=w; j+=w/55) {
        points.add(new pnt(j, i, 10, people.get(count), #ffffff));
        count++;
      }
    }
  }

  void selectFromRange(int min, int max) {
    for (pnt p : points) {
      if (p.o.age > min && p.o.age < max) {
        p.col=255;
        System.out.println("test");
      } else {
        p.col = 0;
      }
    }
  }

  void display() {
    for (pnt p : points) {
      p.display();

      if (p.hover()) {
        fill(255);
        textSize(10);
        text(p.o.name + "\n" + p.o.date + "\n" + p.o.age + "\n" + p.o.address, p.x, p.y-50);
        if (mousePressed) {
          p.col = #27ae60;
        }
      }
    }
  }
}

//------------------------------------------------------------------------------
class lineGraph {

  void display() {
  }
}

class barGraph {
  void display() {
  }
}
//------------------------------------------------------------------------------
class bottom_bar {
  int x, y, w, h, buttonnum, spacing;

  bottom_bar(int x, int y, int w, int h, int buttonnum, int spacing) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.buttonnum = buttonnum;
    this.spacing = spacing;
  }

  void load() {
    for (int i = x+spacing; i < w-5; i+=((w-spacing)/buttonnum)) {
      buttons.add(new button(i, y-spacing, w/buttonnum-spacing, h, 0, "test"));
    }
  }

  void display() {
    for (button b : buttons) {
      b.display();
    }
  }
}
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------