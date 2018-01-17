import java.util.*;

Person person;
dotMap dmapname;
dotMap dmapage;
Switch s1;
Selectionbar top, bottom;
List<Person> people;
List peopleage, peoplename;
List<pnt> pnts;
String[] months;
HashMap<String, Integer> deathinmonths;

boolean showhome = true, showdot, showline;

void setup() {
  size(1250, 500);

  people = new ArrayList<Person>();
  pnts = new ArrayList<pnt>();
  s1 = new Switch(574, 58, 100, 17);

  deathinmonths = new HashMap<String, Integer>();

  String[] data = loadStrings("cemeterydata.txt");
  months = loadStrings("months.txt");

  for (int i = 4; i<data.length; i++) {
    people.add(new Person(extractName(data[i]).toLowerCase(), extractDate(data[i]).toLowerCase(), convertAge(extractAge(data[i])), extractAddress(data[i])));
  }

  peopleage = new ArrayList<Person>(people);
  peoplename = new ArrayList<Person>(people);

  Collections.sort(peopleage, new Agesort());
  Collections.sort(peoplename, new  Namesort());

  dmapname = new dotMap(120, 120, width-120, height-120);
  dmapname.load(peoplename);

  dmapage = new dotMap(120, 120, width-120, height-120);
  dmapage.load(peopleage);

  top = new Selectionbar(0, 0, width, 40, 4);
  top.addLabel("Quit");
  top.addLabel("Dot Map");
  top.addLabel("Line Graph");
  top.load();

  bottom = new Selectionbar(0, height-40, width, 40, 4);
  bottom.addLabel("Infancy\n(0-2)", 0, 2);
  bottom.addLabel("Toddlerhood\n(2-3)", 2, 3);
  bottom.addLabel("Early School Age\n(4-6)", 4, 6);
  bottom.addLabel("Middle Childhood\n(6-12)", 6, 12);
  bottom.addLabel("Early Adolescence\n(12-18)", 12, 18);
  bottom.addLabel("Later Adolescence\n(18-24)", 18, 24);
  bottom.addLabel("Early Adulthood\n(24-34)", 24, 34);
  bottom.addLabel("Middle Adulthood\n(34-60)", 34, 60);
  bottom.addLabel("Later Adulthood\n(60-75)", 60, 75);
  bottom.addLabel("Very Old Age\n(75+)", 75, 200);
  bottom.load();

  for (String m : months) {
    deathinmonths.put(m, deathsInMonth(m));
  }
}
//------------------------------------------------------------------------------
void draw() {
  background(#0f2539);

  //--Home Screen--
  if (showhome) {
    textSize(20);
    text("Cemetery Data Visual", 500, 220);
    textSize(12);
    text("Use the Top Bar to Navigate", 510, 250);
  }

  //--Line Graph--
  if (showline) {
    drawGraph(12*95, 400, 12);
    for (pnt i : pnts) {
      pushMatrix();
      noStroke();
      fill(255, 255, 255, 50);
      translate(50, 50);
      i.display();
      i.hover();
      popMatrix();
    }
  }

  //---Dot Map---
  if (showdot) {
    s1.setLabels("Name", "Age");
    s1.display();
    s1.move();
    strokeWeight(1);
    bottom.display();

    if (s1.getSide()) {
      dmapname.display();
    }
    if (s1.getSide()==false) {
      dmapage.display();
    }

    for (button b : bottom.buttons) {
      if (b.hover() && mousePressed) {
        dmapname.selectFromRange(b.min, b.max);
        dmapage.selectFromRange(b.min, b.max);
      }
    }
  }
  strokeWeight(1);
  top.display();
}

void mouseClicked() {
  if (top.buttons.get(0).hover()) {
    exit();
  }

  if (top.buttons.get(1).hover()) {
    showdot = true;
    showhome = false;
    showline = false;
  }

  if (top.buttons.get(2).hover()) {
    showdot = false;
    showhome = false;
    showline = true;
  }
}