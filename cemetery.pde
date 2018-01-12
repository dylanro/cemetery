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
  bottom.addLabel("Infancy", 0-2);
  bottom.addLabel("Toddlerhood (2 and 3)");
  bottom.addLabel("Early School Age (4 – 6)");
  bottom.addLabel("Middle Childhood (6 – 12)");
  bottom.addLabel("Early Adolescence (12 – 18)");
  bottom.addLabel("Later Adolescence (18 – 24)");
  bottom.addLabel("Early Adulthood (24 – 34)");
  bottom.addLabel("Middle Adulthood (34 – 60)");
  bottom.addLabel("Later Adulthood (60 – 75)");
  bottom.addLabel("Very Old Age (75+)");
  bottom.load();
}
//------------------------------------------------------------------------------
void draw() {
  background(#0f2539);
  dmap.display();
  dmap.selectFromRange(0, );

  bottom.display();

  top.display();
}