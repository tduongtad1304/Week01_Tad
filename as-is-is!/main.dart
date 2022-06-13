// Dart cung cấp 3 operators: as, is, và is! dùng để ép và kiểu tra kiểu dữ liệu tại runtime.
// as dùng để ép kiểu
// is trả về true nếu đúng kiểu được chỉ ra.
// is! trả về true nếu không đúng kiểu được chỉ ra.

//Ta khai baó hai class Human và Car với các thuộc tính tương ứng.
class Human {
  String name;
  int age;
  Human({
    required this.name,
    required this.age,
  });
}

class Car {
  String name;
  int horsePower;
  Car({
    required this.name,
    required this.horsePower,
  });
}

void main(List<String> args) {
  //ở đây ta khai báo một biến target có kiểu Car với các thông số thuộc tính tương ứng.
  var target = Car(name: 'BMW', horsePower: 300);
  (target).name =
      'Tad'; //ở đây ta kiểm tra target hoặc (target as Car) có phải thuộc kiểu Car không, nếu đúng nó sẽ gán biến name với giá trị mới 'Tad'.
  print(target.name); //ở đây ta in ra 'Tad'.

  if (target is! Human) {
    target.name = 'Tad';
    print(target.name);
  }

  try {
    (target as Human).name =
        'Tad'; //Ở đây ta ép target thành Human, nếu đúng nó sẽ gán biến name với giá trị mới 'Tad'.
    //or if (target is Human) {
    //  target.name = 'Tad';
    // print(target.name);
    // }
    print(target.name); //Ở đây throw ra lỗi vì target không phải là Human.
  } catch (e) {
    throw 'Target is not Human';
  }
}
