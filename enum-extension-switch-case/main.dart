import 'dart:io';

// kiểu enum trong dart hay còn gọi là kiểu liệt kê, dùng để chứa các giá trị hằng số mong muốn theo một
// kiểu được định nghĩa trước. Ở đây, chúng ta sẽ khai báo một kiểu enum cho các trạng thái theme của App

enum AppTheme {
  light,
  dark,
  azure,
  neon,
}

//chúng ta có thể viết thêm các phương thức cho các class mà không phải sửa trực tiếp vào class.
//Việc này rất hữu dụng trong trường hợp bạn muốn viết thêm vào một class nào đó
//nhưng class đó lại nằm trong một thư viện nào đó hoặc thậm chí là class trong core của Dart.
//ở đây ta sẽ xây dựng một extension để chuyển kiểu enum thành một string tiện cho việc sử dụng sau này
//khi đụng đến một enum.
extension EnumCovert on AppTheme {
  String enumToString() => this.toString().split('.').last.toUpperCase();
}
//từ khoá this ở đây ám chỉ mỗi một instance của enum đó
//Eg: his.toString().split('.').last.toUpperCase() có thể hiểu:
//AppTheme.light =>(toString) "AppTheme.light" =>(split('.')) ["AppTheme", "light"] =>(last) "light" =>(toUpperCase) "LIGHT"

void main(List<String> args) {
  print("Choose your favorite theme index!");
  print("0. Light");
  print("1. Dark");
  print("2. Azure");
  print("3. Neon");

  int? index =
      int.parse(stdin.readLineSync()!); //giúp user nhập giá trị từ keyboard

  var theme = AppTheme.values[index]; //access giá trị của enum theo index

  final themeString =
      theme.enumToString(); //dùng extension trên để chuyển enum thành string

  print('This is the result when not using the extension: $theme');

  String comment = 'This is the result when using the extension:';

  print('----------------');

  //dùng switch case để in ra các string theme tương ứng theo index
  switch (theme) {
    case AppTheme.dark:
      print('$comment $themeString'); //nếu người dùng nhập 1 thì sẽ in ra Dark

      break;
    case AppTheme.azure:
      print('$comment $themeString'); //nếu người dùng nhập 2 thì sẽ in ra Azure
      break;

    case AppTheme.neon:
      print('$comment $themeString'); //nếu người dùng nhập 3 thì sẽ in ra Neon
      break;

    default:
      print('$comment $themeString'); //nếu người dùng nhập 0 thì sẽ in ra Light
  }
}
