part of 'counter_cubit.dart';

//khái niệm class trong mọi ngôn ngữ lập trình đều quan trọng, nó tạo ra một lớp chưa các
//thuộc tính và phương thức để chứa các logic của một đối tượng và tái sử dụng sau này.

//Extends là kế thừa OOP điển hình có thể được sử dụng khi bạn muốn thêm các tính năng mới trong một lớp con.

//Khi bạn sử dụng class B extends A {}, bạn KHÔNG bị buộc phải ghi đè mọi phương thức của lớp A. Bạn có thể ghi đè bao nhiêu phương thức tùy thích.

// Ở đây ta sử dụng class CounterState extends Equatable {} để kế thừa từ abstract class Equatable.

//Equatable là một package được tạo ra đi kèm với Bloc Package để hỗ trợ việc so sánh các đối tượng dễ dàng hơn mà không phải overrides phương thức == và hashcode của Dart.
class CounterState extends Equatable {
  final int value;

  const CounterState(
      {required this.value}); //constructor của class phải luôn luôn có và chứa những biến ta khai báo trong class trên.

  //Dart cung cấp cho chúng ta factory keyword để tạo ra 1 constructor đặc biệt, khi sử dụng constructor này để
  //tạo đối tượng nó sẽ không tạo ra một đối tượng mới nếu nó thấy đã có một đối tượng có sẵn rồi.
  //hoạt động giống Singleton pattern. Ở đây, nó sẽ tạo ra một constructor tên là CounterState.init()
  //để phục vụ cho bên CounterCubit với CounterState(value: 0);

  factory CounterState.init() => const CounterState(value: 0);

  @override
  List<Object?> get props => [
        value
      ]; //ở đây ta overrides getter props của abstract class Equatable thay vì phương thức == và hashcode của Dart.

  CounterState copyWith({
    //phương thức copyWith để tạo ra 1 instance mới của lớp CounterState. Nếu có value mới thì nó sẽ gán cho value hiện tại, còn không nó giữ nguyên.
    int? value,
  }) {
    return CounterState(
      value: value ?? this.value,
    );
  }
}
