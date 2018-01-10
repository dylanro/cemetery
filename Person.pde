class Person {
  String name;
  String date;
  float age;
  String address;

  Person(String name, String date, float age, String address) {
    this.name = name;
    this.date = date;
    this.age = age;
    this.address = address;
  }

  public String toString() {
    return "name-> " + this.name + " \ndate-> " + this.date + " \nage-> " + age + " \naddress-> " + address + "\n\n";
  }
}

class Sortbyname implements Comparator<Person> {
  @Override
    int compare(Person p1, Person p2) {
    return p1.name.compareTo(p2.name);
  }
}

class Sortbyage implements Comparator<Person> {
  @Override
    int compare(Person p1, Person p2) {
    if (p1.age > p2.age) {
      return 1;
    }
    if (p1.age < p2.age) {
      return -1;
    } else return 0;
  }
}

String extractAge(String line) {
  return line.replaceAll(".*\\d{4}\\s(.{4})\\s.*", "$1");
}

String extractName(String line) {
  return line.replaceAll("\\s.{2}\\s[A-Za-z]+\\s\\d{4}.*", "");
}

String extractDate(String line) {
  return line.replaceAll(".*(.{2}\\s[A-Za-z]{3}\\s\\d{4}).*", "$1");
}

String extractAddress(String line) {
  return line.replaceAll(".*\\d{4}.{6}(.*)", "$1");
}

float convertAge(String age) {
  float num = 0;
  if (age.contains("w")) {
    num = Float.valueOf(age.replaceAll("w", ""))*7/365;
  } else if (age.contains("d")) {
    num = Float.valueOf(age.replaceAll("d", ""))/365;
  } else {
    num = Float.valueOf(age);
  }
  return num;
}