//------------------------------------------------------------------------------
class button {
  int x, y, w, h, round, textsize, value, min, max;
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
    this.min = 0;
    this.max = 0;
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

  void setLabel(String label, int min, int max) {
    this.label = label;
    this.min = min;
    this.max = max;
  }

  void setRound(int round) {
    this.round = round;
  }

  void setHighlight(color col) {
    this.highlightcol = col;
  }

  void setBase(color col) {
    this.basecol = col;
  }
}

//------------------------------------------------------------------------------
class pnt {
  int x, y, r;
  Person o;
  color col;

  pnt(int x, int y) {
    this.x = x;
    this.y = y;
  }

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
    }

    for (pnt p : points) {
      if (p.hover()) {
        stroke(255);
        textSize(10);
        if (mouseY < 153) {
          if (p.o.address.length() > p.o.name.length()) {
            fill(51);
            rect(p.x+7, p.y-15, p.o.address.length()*5.5, 70);
          } else {
            fill(51);
            rect(p.x+7, p.y-15, p.o.name.length()*5.5, 70);
          }
          fill(255);
          text(p.o.name + "\n" + p.o.date + "\n" + p.o.age + "\n" + p.o.address, p.x+10, p.y);
        } else {
          if (p.o.address.length() > p.o.name.length()) {
            fill(51);
            rect(p.x+7, p.y-65, p.o.address.length()*5.5, 72);
          } else {
            fill(51);
            rect(p.x+7, p.y-65, p.o.name.length()*5.5, 72);
          }
          fill(255);
          text(p.o.name + "\n" + p.o.date + "\n" + p.o.age + "\n" + p.o.address, p.x+10, p.y-50);
        }
      }
    }

    fill(255);
    textSize(13.25);
    text("This \"Dot Map\" is a visual representation of different age groups in the cemetery. Hover over and click on the bottom buttons\n to select different age groups. These age groups were collected from \"Development Through Life\" by Newman & Newman.", x, y-50);
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
    this.h = h;
    this.spacing = spacing;
    this.w = w;
  }

  void display() {
    for (button b : buttons) {
      b.display();
    }
  }

  void load() {
    try {
      for (int i = x+spacing; i < w; i+=(w-spacing*labels.size())/labels.size()+spacing) {
        buttons.add(new button(i, y-spacing, (w-spacing*labels.size())/labels.size(), h));
      }

      for (int i = 0; i< labels.size(); i++) {
        buttons.get(i).setLabel(labels.get(i).s, labels.get(i).min, labels.get(i).max);
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
void drawGraph(int w, int h, int inc) {
  pushMatrix();
  translate(50, 50);
  stroke(#359768);
  strokeWeight(5);
  line(0, 0, 0, h);
  line(0, h, w, h);

  for (int i = 1; i<12; i+=1) {
    strokeWeight(2);
    stroke(#028090);
    line(i*w/inc, h-deathinmonths.get(months[i-1])*4, i*w/inc+w/inc, h-deathinmonths.get(months[i])*4);
  }

  for (int i = 1; i<13; i+=1) {
    strokeWeight(7);
    stroke(#FCE38A);
    pnts.add(new pnt(i*w/inc, h-deathinmonths.get(months[i-1])*4));

    fill(#FFFFFF);
    strokeWeight(2);
    stroke(255);
    line(i*w/inc, h-5, i*w/inc, h+5);
    text(months[i-1], i*w/inc-10, h+20);
  }
  popMatrix();
  textSize(20);
  text("Number of People Burried in a Specific Month", 70, 63);
}