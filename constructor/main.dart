import 'constructor.dart';

void main(List<String> args) {
  var student1 = Student(0, 'Tady',
      21); //tạo một đối tượng student1 thể hiện qua Constructor Student với đầy đủ 3 tham số

  var student2 = Student.fromAge(
      age:
          22); //tạo một đối tượng student2 thể hiện qua Constructor thứ 2 là kiểu ClassName.identifier với tham số age.

  var student3 = Student.fromIdAndAge(2,
      24); //tạo một đối tượng student3 thể hiện quaConstructor thứ 3 này cũng tương tự nhưng với tham số id và age.

  var student4 = Student.secondConstructor(
      name:
          'Thai Duong'); //tạo một đối tượng student4 thể hiện quaConstructor thứ 4 là redirecting constructor với tham số name.

  print('Id Sinh viên 1: ${student1.id}');

  print('Tuổi Sinh viên 2: ${student2.age}');

  print('Id và Tuổi Sinh viên 3: ${student3.id} - ${student3.age}');

  print('Tên Sinh viên 4: ${student4.name}');

  final dog = Animal.createAnimal(
      "dog"); //tạo một đối tượng dog kiểu final thể hiện qua Factory Constructor Animal với tham số type là dog.

  final cat = Animal.createAnimal(
      "cat"); //tạo một đối tượng cat kiểu final thể hiện qua Factory Constructor Animal với tham số type là cat.

  print(dog.runtimeType);

  print(cat.runtimeType);

  final teacher = new Teacher(
      'Jason'); //tạo một đối tượng Lecturer kiểu final thể hiện qua Constructor Teacher với tham số đầu vào là name kiểu String.

  print(teacher.runtimeType);
}

//Output:

// Id Sinh viên 1: 0
// Tuổi Sinh viên 2: 22
// Id và Tuổi Sinh viên 3: 2 - 24
// Tên Sinh viên 4: Thai Duong
// Dog
// Cat
// Speaker Jason
// Speak louder please
// Lecturer Jason
// Lecturer is a part of Speaker
// Teacher