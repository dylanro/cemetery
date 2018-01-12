import java.util.*;

import java.util.Map;
button b;
Person person;
dotMap dmap;
Selectionbar bottom;
Selectionbar top;
ArrayList<Person> people;
ArrayList<button> buttons;

void setup() {
  size(1250, 500);

  people = new ArrayList<Person>();
  buttons = new ArrayList<button>();

  String[] data = loadStrings("cemeterydata.txt");

  for (int i = 4; i<data.length; i++) {
    people.add(new Person(extractName(data[i]).toLowerCase(), extractDate(data[i]).toLowerCase(), convertAge(extractAge(data[i])), extractAddress(data[i])));
  }
  Collections.sort(people, new Sortbyage());

  dmap = new dotMap(120, 120, width-120, height-120);
  dmap.load();

  top = new Selectionbar(0, 0, width, 40, 4);

  bottom = new Selectionbar(0, height-75, width, 75, 4);
}
//------------------------------------------------------------------------------
void draw() {
  background(#0f2539);
  dmap.display();
  dmap.selectFromRange(0, 7);

  bottom.display();

  top.display();
}

void mouseClicked() {
  for (button b : buttons) {
    if (b.hover()) {
    }
  }
}