import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

//lớp CounterCubit sẽ kế thừa lớp CounterState thông qua abstract class Cubit (base của Bloc Package)
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.init());
  //constructor của class trên, có từ khoá super để kế thừa đc giá trị của lớp cha là lớp CounterState
  //ở đây có tác dụng truyền vào cho CounterCubit một giá trị khởi tạo ban đầu, như vậy nó có giá trị là CounterState.init()
  //với value là 0.

  //phương thức emit() của Bloc Package dùng để gửi một giá trị mới cho CounterCubit khi function được gọi ở đâu đó
  //ở đây là function increment (có thể được gọi ở main), khi được gọi, nó sẽ đổi trạng thái của value mỗi lần cộng thêm 1.
  //cùng với tác dụng của phương thức copyWith đã nói, giúp nhận dạng value có thay đổi hay không.
  void increment() => emit(state.copyWith(value: state.value + 1));
}
