//Ta tạo ra một Iterable mang kiểu int makeRange để tạo ra một loạt các số kiểu int từ start đến end
//từ khoá sync* lúc này được sử dụng để tạo ra một stream một loạt các số kiểu int từ start đến end đó ngay tức khắc khi gọi đến mà không phải chờ như async*.
Iterable<int> makeRange(int start, int end) sync* {
  for (int i = start; i < end; i++) {
    yield i; //yield trả về giá trị Iterable hoặc 1 Stream
    yield* makeRange(end - 2,
        end); //yield* được sử dụng sau khi yield ở trên thực hiện xong và function này sẽ được gọi một cách đệ quy, tạo ra liên tục các giá trị hoặc Stream.
  }
}

void main(List<String> args) {
  final range1 = makeRange(1, 5);

  var range2 = range1.map((e) => e * 2);

  range2.forEach(
      print); //kết quả in ra sẽ là 2 4 6 8, và sau đó sẽ là loạt đệ của yield* bên dưới
  //bắt đầu từ vị trí end - 2, end) => vòng lặp liên tục trả ra kết quả stream các giá trị 6 và 8 liên tục.
}
