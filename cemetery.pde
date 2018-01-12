import java.util.*;

import java.util.Map;
button b;
Person person;
dotMap dmap;
Selectionbar bottom;
Selectionbar top;
ArrayList<Person> people;

void setup() {
  size(1250, 500);

  people = new ArrayList<Person>();

  String[] data = loadStrings("cemeterydata.txt");

  for (int i = 4; i<data.length; i++) {
    people.add(new Person(extractName(data[i]).toLowerCase(), extractDate(data[i]).toLowerCase(), convertAge(extractAge(data[i])), extractAddress(data[i])));
  }
  Collections.sort(people, new Sortbyage());

  dmap = new dotMap(120, 120, width-120, height-120);
  dmap.load();

  top = new Selectionbar(0, 0, width, 40, 4);
  top.addLabel("Quit");
  top.addLabel("Dot Map");
  top.addLabel("Line Graph");
  top.load();

  bottom = new Selectionbar(0, height-75, width, 75, 4);
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
}
//------------------------------------------------------------------------------
void draw() {
  background(#0f2539);

  for (button b : bottom.buttons) {
    if (b.hover()==true && mousePressed) {
      dmap.selectFromRange(b.min, b.max);
    }
  }

  bottom.display();

  top.display();

  dmap.display();
}

void mouseClicked() {
  System.out.println(mouseX + "   " + mouseY);
}