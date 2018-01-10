import java.util.*;
button b;
Person person;
dotMap dmap;
ArrayList<Person> people;
ArrayList<pnt> points;

void setup() {
  size(1250, 500);

  people = new ArrayList<Person>();
  points = new ArrayList<pnt>();
  String[] data = loadStrings("cemeterydata.txt");

  for (int i = 4; i<data.length; i++) {
    people.add(new Person(extractName(data[i]).toLowerCase(), extractDate(data[i]).toLowerCase(), convertAge(extractAge(data[i])), extractAddress(data[i])));
  }
  Collections.sort(people, new Sortbyage());

  dmap = new dotMap(120, 120, width-120, height-120);
  dmap.load();
}

void draw() {
  background(#0f2539);
  dmap.display();
  fill(255);
}

//used for buttoint c;ns
void mouseClicked() {
}