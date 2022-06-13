//Làm việc với async await trong Dart dễ dàng hơn với Future và Stream.
//Ở đây ta sẽ tạo ra function getValues với tham số đâu vào là n kiểu int, mục đích là để lấy ra
//chính giá trị n đó sau một khoảng thời gian chờ nhất định, do đó ta sẽ trả về kiểu Future<int>.
//thêm cặp từ khoá async await để thực hiện bất đồng bộ việc lấy giá trị này, giả lập với Future delayed trong vòng 1s.

Future<int> getValues(int n) async {
  await Future.delayed(const Duration(seconds: 1));
  return n;
}

//Khác với async sử dụng cho việc sử dụng Future để đưa ra một giá trị nào đó cụ thể (từ server, API hoặc nơi nào đó cần thời gian để lấy dữ liệu xử lý trả về)
//thì async* sẽ là từ khoá dùng để cho chúng ta trả về một stream các giá trị cũng sau một khoảng thời nhất định lặp lại giữa các phần tử trong Stream.
//Ở đây tạo ra function getSomeValues với tham số đâu vào là n kiểu int, mục đích là để lấy ra
//một stream các giá trị trong khoảng từ 0 cho đến n - 1 số, sau một khoảng thời gian chờ nhất định lặp lại giữa các phần tử của Stream, do đó ta sẽ trả về kiểu Stream<int>.
Stream<int> getSomeValues(int n) async* {
  await Future.delayed(const Duration(seconds: 2));
  for (int i = 0; i < n; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

void main(List<String> args) {
  late Future<int>
      values; //late giúp chúng ta không cần khởi tạo đối tượng values thuộc kiểu Future<int> ngay lập tức hoặc các biến không cần khởi tạo liền, chúng ta có thể sử dụng giá trị values trong chương trình sau đó.

  late Stream<int> someValues; //cũng giống như trên nhưng là với Stream.

  values = getValues(5);
  values = getValues(100);
  //gán giá trị cho values bằng getValues(100), lúc này biến values sẽ được access nhưng phải đợi đến khi
  //Future getValues(100) được thực hiện xong bên dưới.

  values
      .then((value) => value = value * 2)
      .then((value) => print(
          value)) //lúc này biến values đã đc access, sau đó print ra giá trị values lúc này bằng 2 lần giá trị đầu tiên.
      .then((_) => print('Done'));

  someValues = getSomeValues(10); //tương tự ở trên nhưng là với Stream.

  someValues.listen((value) => print(value)).onDone(() => print('Done'));
}
