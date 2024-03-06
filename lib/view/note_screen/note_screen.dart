// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:todo_dec/controller/note_screen_controller.dart';
import 'package:todo_dec/utils/constants/color_constants.dart';
import 'package:todo_dec/view/note_screen/widget/custom_bottom_sheet.dart';
import 'package:todo_dec/view/note_screen/widget/custom_note_widget.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  NoteScreenController noteScreenController = NoteScreenController();
  var myBox = Hive.box("noteBox");

  @override
  void initState() {
    noteScreenController.init();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainBlack,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.mainLightGrey,
        onPressed: () {
          NoteScreenController.clearControllers();

          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => CustomBottomSheet(
                    onSavePressed: () {
                      // function to add a new note
                      noteScreenController.addData();
                      setState(() {});
                      NoteScreenController.clearControllers();

                      Navigator.pop(context);
                    },
                  ));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: ColorConstants.mainBlack,
        centerTitle: true,
        title: Text("Note Pad"),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorConstants.mainWhite,
            fontSize: 28),
      ),
      body: noteScreenController.noteKeys.isEmpty
          ? Center(
              child: Text(
                "No data found",
                style: TextStyle(color: ColorConstants.mainWhite),
              ),
            )
          : ListView.separated(
              itemCount: noteScreenController.noteKeys.length,
              padding: EdgeInsets.all(15),
              itemBuilder: (context, index) {
                var element = myBox.get(noteScreenController.noteKeys[index]);
                return CustomNotesWidget(
                  title: element["title"],
                  date: element["date"],
                  des: element["des"],
                  noteColor: element["color"] != null
                      ? NoteScreenController.colorsList[element["color"]]
                      : Colors.white,
                  onDeletePressed: () {
                    // to delete a data from the list

                    noteScreenController
                        .deleteData(noteScreenController.noteKeys[index]);
                    setState(() {});
                  },
                  onEditPresssed: () {
                    //ASSIGNING VALUES TO CONTROLEERS WHILE EDITING
                    NoteScreenController.titleController.text =
                        element["title"];
                    NoteScreenController.desController.text = element["des"];
                    NoteScreenController.dateController.text = element["date"];

                    noteScreenController.onColorSelection(element["color"]);
// bottom sheet to update a data
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => CustomBottomSheet(
                              isEdit: true,
                              onSavePressed: () {
                                // function to edit a note

                                noteScreenController.editData(
                                    noteScreenController.noteKeys[index]);
                                setState(() {});
                                NoteScreenController
                                    .clearControllers(); // CLEAR CONTROLLERS

                                Navigator.pop(context);
                              },
                            ));
                  },
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 20),
            ),
    );
  }
}
