abstract class Role {
  void displayRole();
}

class Person implements Role {
  late String? name;
  late int? age;
  late String? address;

  Person(this.name, this.age, this.address);

  @override
  void displayRole() {
    // Implementation in the derived classes
  }
}

class Student extends Person {
  late int? studentId;
  late String? grade;
  late List<int> courseScores = [];

  Student(String name, int age, String address, this.studentId, this.grade)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double avgCal() {
    int sum = courseScores.reduce((a, b) => a + b);
    return sum / courseScores.length;
  }

  void displayAllInfo() {
    displayRole();
    print('Name: $name');
    print('Age: $age');
    print('Address: $address');
    print('Average: ${avgCal()}');
  }
}

class Teacher extends Person {
  late int? teacherId;
  List<String> courseTaught = [];

  Teacher(String name, int age, String address, this.teacherId)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void courseTaughts() {
    for (String course in courseTaught) {
      print('- $course');
    }
  }

  void displayAllInfo() {
    displayRole();
    print('Name: $name');
    print('Age: $age');
    print('Address: $address');
    courseTaughts();
  }
}

void main() {
  Student objOne = Student('John Doe', 20, '123 Main st', 1, 'A');
  objOne.courseScores = [10, 20, 3];
  objOne.displayAllInfo();

  Teacher objTwo = Teacher('Mrs. Smith', 35, '456 Oak st', 3);
  objTwo.courseTaught = ['Math', 'English', 'Bangla'];
  objTwo.displayAllInfo();
}