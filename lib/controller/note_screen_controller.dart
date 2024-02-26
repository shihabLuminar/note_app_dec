import 'package:flutter/material.dart';

class NoteScreenController {
  static TextEditingController titleController = TextEditingController();
  static TextEditingController desController = TextEditingController();
  static TextEditingController dateController = TextEditingController();

  static Color selectColor = Colors.white;
  List notesList = [];

  //function to add data

  void addData() {
    notesList.add(
      {
        "title": titleController.text,
        "des": desController.text,
        "date": dateController.text,
        "color": selectColor
      },
    );
  }

  // function to delete data

  void deleteData(int index) {
    notesList.removeAt(index);
  }

  // function to edit data

  void editData() {}

  //clear controllers

  static void clearControllers() {
    titleController.clear();
    desController.clear();
    dateController.clear();
  }

  // on color seleciton

  void onColorSelection(Color newColor) {
    selectColor = newColor;
  }
}
