import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_dec/utils/constants/color_constants.dart';

class NoteScreenController {
  static TextEditingController titleController = TextEditingController();
  static TextEditingController desController = TextEditingController();
  static TextEditingController dateController = TextEditingController();
  static List colorsList = [
    ColorConstants.redNote,
    ColorConstants.blueNote,
    ColorConstants.greenNote,
    ColorConstants.yellowNote,
  ];
  static int selectColorIndex = 0;
  List notesList = [];

  List noteKeys = [];
  // // HIVE step 4
  var myBox = Hive.box("noteBox");

  //function to add data

  void addData() {
    myBox.add(
      {
        "title": titleController.text,
        "des": desController.text,
        "date": dateController.text,
        "color": selectColorIndex
      },
    );
    noteKeys = myBox.keys.toList();
    print(noteKeys);
    print(myBox.values.toList());
  }

  // function to delete data

  void deleteData(var key) {
    myBox.delete(key);
    noteKeys = myBox.keys.toList();
  }

  // function to edit data

  void editData(var key) {
    myBox.put(key, {
      "title": titleController.text,
      "des": desController.text,
      "date": dateController.text,
      "color": selectColorIndex
    });
  }

  //clear controllers

  static void clearControllers() {
    titleController.clear();
    desController.clear();
    dateController.clear();
  }

  // on color seleciton

  void onColorSelection(int newColorIndex) {
    selectColorIndex = newColorIndex;
  }

  init() {
    noteKeys = myBox.keys.toList();
  }
}
