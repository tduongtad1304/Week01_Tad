// ignore_for_file: avoid_print

import 'mixin_with.dart';

void main(List<String> args) {
  final animal = Animal(); //tạo một đối tượng Animal
  final human = Human(); //tạo một đối tượng Human

  print('Animal:');
  //sử dụng các phương thức của lớp Animal
  animal
    ..calorConsume(1200)
    ..sayThirsty()
    ..sayHappy()
    ..sayChill();

  print('-------------------------');

  print('Human:');
  //sử dụng các phương thức của lớp Human
  human
    ..calorConsume(3000)
    ..breathing() //mixin Breathing
    ..eating() //mixin Eating
    ..sayThirsty() //extends Animal
    ..meetings() //extends Animal mixin từ MeetingFriends on Animal
    ..sayHappy(); //extends Animal
}

//Output: 

//Animal:
// calor consume: 1200
// Running makes me thirsty
// Running is happy
// Running is chill
// -------------------------
// Human:
// calor consume: 3000
// Also Breathing
// Must not eating before running
// Running makes me thirsty
// Meeting friends when running
// Running is happy
