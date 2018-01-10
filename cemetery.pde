import java.util.*;

import java.util.Map;
button b;
Person person;
dotMap dmap;
bottom_bar bbar;
ArrayList<Person> people;
ArrayList<pnt> points;
ArrayList<button> buttons;

void setup() {
  size(1250, 500);

  people = new ArrayList<Person>();
  points = new ArrayList<pnt>();
  buttons = new ArrayList<button>();

  String[] data = loadStrings("cemeterydata.txt");

  for (int i = 4; i<data.length; i++) {
    people.add(new Person(extractName(data[i]).toLowerCase(), extractDate(data[i]).toLowerCase(), convertAge(extractAge(data[i])), extractAddress(data[i])));
  }
  Collections.sort(people, new Sortbyage());

  dmap = new dotMap(120, 120, width-120, height-120);
  dmap.load();

  bbar = new bottom_bar(0, height-75, width, 75, 5, 4);
  bbar.load();
}
//------------------------------------------------------------------------------
void draw() {
  background(#0f2539);
  dmap.display();
  bbar.display();
}

void mouseClicked() {
  for (button b : buttons) {
    if (b.hover()) {
    }
  }
}