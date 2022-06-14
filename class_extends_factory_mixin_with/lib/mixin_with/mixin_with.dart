// ignore_for_file: avoid_print

//Như trong bất kỳ ngôn ngữ OOP nào, một lớp trừu tượng không thể được khởi tạo trực tiếp.
// Trong Dart, bạn chỉ có thể sử dụng từ khóa abstract trên các lớp vì các phương thức trừu tượng
// chỉ đơn giản là không có phần thân. Ở đây tạo một lớp trừu tượng tên là ConsumeCalor.
abstract class ConsumeCalor {
  const ConsumeCalor(); //constructor của abstract class

  void calorConsume(
      int calor); //phương thức abstract calorConsume yêu cầu đầu vào là biến kiểu int

  int? get calor; //getter cho calor, trả về giá trị của biến calor

  void sayThirsty() => print(
      'I am thirsty'); //phương thức abstract sayThirsty in ra thông báo 'I am thirsty'

  void sayHappy() => print(
      'I am happy'); //phương thức abstract sayHappy in ra thông báo 'I am happy'

  void sayChill() => print(
      'I am chill'); //phương thức abstract sayChill in ra thông báo 'I am chill'
}

//tạo ra 1 class tên là Animal, ở đây ta thấy có từ khoá implements ám chỉ việc class Animal kế thừa abstract class ConsumeCalor
//và như vậy có thể coi class ConsumeCalor được kế thừa kia như một interfaces mặc dù Dart không có từ khoá interfaces.
//Bất kỳ lớp nào cũng được phép triển khai một hoặc nhiều interfaces.
//Khi sử dụng các implements, ta phải ghi đè mọi phương thức được khai báo trong lớp cha. Vì thế class Animal phải overrides hết các phương thức của ConsumeCalor như ở dưới.
//Ta cũng có thể sử dụng một lớp thông thường làm interface.
class Animal implements ConsumeCalor {
  void running() =>
      print('running'); //phương thức ta định nghĩa riêng cho class Animal

  @override
  int? get calor => 400; //ghi đè getter của ConsumeCalor

  @override
  void calorConsume(int calor) {
    print(
        'calor consume: $calor'); //ghi đè phương thức calorConsume của ConsumeCalor
  }

  @override
  void sayChill() {
    print(
        'Running is chill'); //ghi đè phương thức sayChill của ConsumeCalor và custom lại.
  }

  @override
  void sayHappy() {
    print(
        'Running is happy'); //ghi đè phương thức sayHappy của ConsumeCalor và custom lại.
  }

  @override
  void sayThirsty() {
    print(
        'Running makes me thirsty'); //ghi đè phương thức sayThirsty của ConsumeCalor và custom lại.
  }
}

//Mixin là một loại lớp có thể được kết hợp được với một lớp khác để sử dụng lại các đoạn code
//mà không cần sử dụng tính kế thừa.
//Mixin rất hữu ích khi ta cần chia sẻ code mà không cần sử dụng tính năng thừa kế.
//Khi ta sử dụng class B with A {}, bạn importing mọi phương thức của mixin A vào lớp B. Theo tùy chọn,
//việc sử dụng mixin có thể bị giới hạn ở một loại nhất định bằng cách sử dụng từ khóa on.
//Ta có thể sử dụng with một hoặc nhiều mixin.

//Ở đây ta tạo ba mixin lần lượt là Breathing, Eating, MeetingFriends.
mixin Breathing {
  void breathing() => print(
      'Also Breathing'); //phương thức breathing ta định nghĩa riêng cho mixin Breathing
}

mixin Eating {
  void eating() => print(
      'Must not eating before running'); //phương thức eating ta định nghĩa riêng cho mixin Eating
}

//phương thức meetings ta định nghĩa riêng cho mixin MeetingFriends, ở đây ta dùng on để giới hạn sử dụng cho mixin này chỉ trên một số loại nhất định, ở đây là Animal.
mixin MeetingFriends on Animal {
  void meetings() => print('Meeting friends when running');
}
//phương thức meetings ta định nghĩa riêng cho mixin Reproduction, ở đây ta dùng on để giới hạn sử dụng cho mixin này chỉ trên một số loại nhất định, ở đây là Animal.
mixin Reproduction on Animal {
  void copulate() => print('Copulate');
  void reproduce() => print('Animal is able to reproduce');
}

//phương thức meetings ta định nghĩa riêng cho mixin Talking,
//ở đây ta dùng on để giới hạn sử dụng cho mixin này chỉ trên một số loại nhất định, ở đây là Animal.
//ngoài ra, ta còn có thể override một trong các method sẵn có của lớp X ở đây là Animal, định nghĩa lại trong mixin này.
//ví dụ sayThirsty().
mixin Talking on Animal {
  void talking() => print('Talk talk');
  @override
  void sayThirsty() => print('Feel thirsty due to talking to much');
}

//cuối cùng ta kết hợp cả extends và mixin như ở dưới.
//class Human sẽ kế thừa lớp Animal nhưng không bắt buộc phải ghi đè hết tất cả các phương thức trong Animal
//như việc Animal phải ghi đè các phương thức của interfaces ConsumeCalor.
//ta có thể sử dụng with một hoặc nhiều mixin cho class Human để sử dụng các phương thức của các mixin đó, ngoài ra, ta thấy mixin MeetingFriends chỉ được.
//giới hạn sử dụng trên class Animal nhưng vì class Human extends Animal nên ta có thể sử dụng mixin MeetingFriends cho class Human.
//ta còn có thể override các phương thức có sẵn trong lớp extends Animal hoặc ngay cả trong các mixin
//ở đây ta override method talking() trong mixin Talking.
class Human extends Animal
    with Breathing, Eating, MeetingFriends, Reproduction, Talking {
  @override
  void talking() => print('We don\'t talk anymore');
}
