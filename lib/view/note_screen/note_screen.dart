// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainBlack,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.mainLightGrey,
        onPressed: () {
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
      body: ListView.separated(
        itemCount: noteScreenController.notesList.length,
        padding: EdgeInsets.all(15),
        itemBuilder: (context, index) => CustomNotesWidget(
          title: noteScreenController.notesList[index]["title"],
          date: noteScreenController.notesList[index]["date"],
          des: noteScreenController.notesList[index]["des"],
          noteColor: noteScreenController.notesList[index]["color"],
          onDeletePressed: () {
            // to delete a data from the list

            noteScreenController.deleteData(index);
            setState(() {});
          },
        ),
        separatorBuilder: (context, index) => SizedBox(height: 20),
      ),
    );
  }
}
