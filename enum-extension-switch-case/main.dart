import 'dart:io';

enum AppTheme {
  light,
  dark,
  azure,
  neon,
}

extension EnumCovert on AppTheme {
  String enumToString() => this.toString().split('.').last.toUpperCase();
}

void main(List<String> args) {
  print("Choose your favorite theme index!");
  print("0. Light");
  print("1. Dark");
  print("2. Azure");
  print("3. Neon");

  int? index = int.parse(stdin.readLineSync()!);

  var theme = AppTheme.values[index];

  final themeString = theme.enumToString();

  print('This is the result when not using the extension: $theme');

  String comment = 'This is the result when using the extension:';

  print('----------------');

  switch (theme) {
    case AppTheme.dark:
      print('$comment $themeString');

      break;
    case AppTheme.azure:
      print('$comment $themeString');
      break;

    case AppTheme.neon:
      print('$comment $themeString');
      break;

    default:
      print('$comment $themeString');
  }
}
