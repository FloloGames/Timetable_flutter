import 'package:flutter/material.dart';

class LessonContainer {
  final Color _color = const Color.fromRGBO(0, 0, 0, 0);
  late String _name;
  late String _teacher;

  String getName() => _name;
  void setName(String name) => _name = name;
  String getTeacher() => _teacher;
  void setTeacher(String teacher) => _teacher = teacher;

  List<Lesson> lessonTypes = [];

  LessonContainer({String name = "Fach", String teacher = "Lehrkraft"}) {
    _name = name;
    _teacher = teacher;
    lessonTypes.add(Lesson(lessonContainer: this));
  }
}

class Lesson {
  LessonContainer _lessonContainer;
  String _room = "";
  String _gebaeude = "";

  Lesson(
      {required LessonContainer lessonContainer,
      String room = "Raum",
      String gebaeude = "Gebäude"})
      : _lessonContainer = lessonContainer {
    _room = room;
    _gebaeude = gebaeude;
  }
}
