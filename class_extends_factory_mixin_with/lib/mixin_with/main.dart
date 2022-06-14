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
    ..talking() //mixin Talking and override it.
    ..sayThirsty() //extends Animal while mixin Talking on Animal => override sayThirsty() in this mixin
    ..meetings() //extends Animal mixin từ MeetingFriends on Animal
    ..sayHappy(); //extends Animal

  //mixin Reproduction
  human
    ..copulate()
    ..reproduce();
}

//Output: 

// Animal:
// calor consume: 1200
// Running makes me thirsty
// Running is happy
// Running is chill
// -------------------------
// Human:
// calor consume: 3000
// Also Breathing
// Must not eating before running
// We don't talk anymore
// Running makes me thirsty
// Meeting thirsty
// Reproduction thirsty
// Talking thirsty
// Meeting friends when running
// Running is happy
// Copulate
// Animal is able to reproduce
