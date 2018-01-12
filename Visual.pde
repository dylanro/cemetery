//------------------------------------------------------------------------------
class button {
  int x, y, w, h, round, textsize, value;
  String label;
  color basecol, highlightcol;

  button(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.round = 0;
    this.label = "";
    this.basecol = 0;
    this.highlightcol = 51;
    textsize = 10;
    this.value = 0;
  }

  void display() {
    if (hover()==false) {
      noStroke();
      fill(basecol);
    }
    if (hover()) {
      stroke(#8bc6ec);
      fill(highlightcol);
    }
    rect(x, y, w, h, round);
    fill(255);
    textSize(textsize);
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
  void setLabel(String label, int val) {
    this.label = label;
    this.value = val;
  }

  void setRound(int round) {
    this.round = round;
  }

  void setHighlight(int col) {
    this.highlightcol = col;
  }

  void setBase(int col) {
    this.basecol = col;
  }

  void setValue(int val) {
    this.value = val;
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

//------------------------------------------------------------------------------
class dotMap {
  int x, y, w, h, count;
  ArrayList<pnt> points = new ArrayList<pnt>();

  dotMap(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  void load() {
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
class Selectionbar {
  int x, y, w, h, spacing, buttonnum;
  List<Label>  labels = new ArrayList<Label>();
  List<button> buttons = new ArrayList<button>();

  Selectionbar(int x, int y, int w, int h, int spacing) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.spacing = spacing;
  }

  void display() {
    for (button b : buttons) {
      b.display();
    }
  }

  void load() {
    try {
      for (int i = x+spacing; i < w-spacing; i+=(w-spacing*labels.size())/labels.size()+spacing) {
        buttons.add(new button(i, y-spacing, (w-spacing*labels.size())/labels.size(), h));
      }

      for (int i = 0; i< labels.size(); i++) {
        buttons.get(i).setLabel(labels.get(i).s, labels.get(i).val);
      }
    }
    catch(ArithmeticException a) { 
      System.out.println("At least one label must be added in order to create the selection bar!\nThe method addLabel() is used to add more labels to your selectionbar\nUse \" \" to make the button empty!");
    }
  }

  void addLabel(String s, int val) {
    labels.add(new Label(s, val));
  }

  void addLabel(String s) {
    labels.add(new Label(s, 0));
  }

  void addLabel(String s, int min, int max) {
    labels.add(new Label(s, min, max));
  }
}
//------------------------------------------------------------------------------
class Label {
  String s;
  int val, min, max;

  Label(String s, int val) {
    this.s = s;
    this.val = val;
  }

  Label(String s, int min, int max) {
    this.s = s;
    this.min = min;
    this. max = max;
  }
}
//------------------------------------------------------------------------------