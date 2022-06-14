//Hàm khởi tạo mặc định hoặc hàm tạo không mặc định, một hàm tạo không có tham số được gọi là hàm tạo mặc định
//hoặc hàm tạo không có đối số. Nó được tạo tự động (không có đối số) bởi trình biên dịch Dart nếu chúng ta không khai báo trong lớp.
//Trình biên dịch Dart bỏ qua hàm tạo mặc định nếu chúng ta tạo một hàm tạo có đối số hoặc không có đối số.
class Human {
  const Human();
}

//ClassName constructor
//Chúng ta cũng có thể truyền các tham số cho một phương thức khởi tạo
// mà loại phương thức khởi tạo đó được gọi là phương thức khởi tạo tham số hóa.
// Nó được sử dụng để khởi tạo các biến cá thể.
//Ỏ đây ta tạo 1 class tên Student với ba tham số id, name, age.
//Dart cho phép chúng ta đặt tên constructors để tạo ra nhiều hơn 1 constructor.
class Student {
  var id;
  var name;
  var age;

  Student(
      this.id, this.name, this.age); //Constructor Student với đầy đủ 3 tham số

  //Constructor thứ 2 là kiểu ClassName.identifier dùng để định nghĩa
  //nhiều constructors trong class và khiến chúng rõ ràng hơn.
  Student.fromAge({required int age}) {
    id = 5;
    this.age = age;
    name = 'Tad';
  }

  //Constructor thứ 3 này cũng tương tự.
  Student.fromIdAndAge(int id, int age) {
    this.id = id;
    name = 'Tad';
    this.age = age;
  }

  //Đây là redirecting constructor, dùng để tạo 1 constructor từ một constructor khác trong cùng class.
  //hay là redirect đến một constructor khác trong một class.
  //Ở đây là một constructor mới đuọc redirect từ class Student ban đầu, required tham số là name, phía sau this các tham số ban đầu của nó,
  //có liên quan đến Student, gồm id, name, age.
  Student.secondConstructor({required name}) : this(1, name, 20);
}

abstract class Animal {
  Animal();

  // Dùng để implement một constructor mà nó không nhất thiết phải tạo new instance của chính class đó,
  // mà có thể trả về instance của subtype.
  //Ở đây ta tạo một lớp trừu tượng Animal với constructor mặc định Animal, và hai lớp Dog, Cat extends từ Animal.
  //constructor này sẽ trả về instance của subtype dựa theo tham số type mà ta truyền vào, nếu là dog thì trả về instance class Dog
  //và ngược lại.
  factory Animal.createAnimal(String type) {
    if (type == "dog") {
      return Dog();
    } else {
      return Cat();
    }
  }
}

class Dog extends Animal {
  Dog({name = 'Dog'}) : super();
}

class Cat extends Animal {
  Cat({name = 'Cat'}) : super();
}
