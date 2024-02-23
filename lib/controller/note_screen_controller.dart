import 'package:flutter/material.dart';

class NoteScreenController {
  static TextEditingController titleController = TextEditingController();
  static TextEditingController desController = TextEditingController();
  static TextEditingController dateController = TextEditingController();

  static Color selectColor = Colors.white;
  List notesList = [
    {
      "title": "Lorem Ipsum",
      "des":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
      "date": "date",
      "color": Colors.white,
    },
  ];

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
