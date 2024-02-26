import 'package:flutter/material.dart';
import 'package:todo_dec/controller/note_screen_controller.dart';
import 'package:todo_dec/utils/constants/color_constants.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key,
    this.onSavePressed,
    this.isEdit = false,
  });

  final void Function()? onSavePressed;
  final bool isEdit;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  List colorsList = [
    ColorConstants.redNote,
    ColorConstants.blueNote,
    ColorConstants.greenNote,
    ColorConstants.yellowNote,
  ];

  int selectedColorIndex = 0;

  // global key

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, bottomSetState) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          decoration: BoxDecoration(
            color: ColorConstants.mainDarkGrey,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: NoteScreenController.titleController,
                  decoration: InputDecoration(
                      label: Text("Title"),
                      border: OutlineInputBorder(),
                      fillColor: ColorConstants.mainLightGrey,
                      filled: true),
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return "Enter a valid title";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: NoteScreenController.desController,
                  decoration: InputDecoration(
                      label: Text("Description"),
                      border: OutlineInputBorder(),
                      fillColor: ColorConstants.mainLightGrey,
                      filled: true),
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return "Enter a valid description";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: NoteScreenController.dateController,
                  decoration: InputDecoration(
                      label: Text("Date"),
                      border: OutlineInputBorder(),
                      fillColor: ColorConstants.mainLightGrey,
                      filled: true),
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return "select a valid date";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        var obj = NoteScreenController();

                        selectedColorIndex = index;

                        obj.onColorSelection(colorsList[selectedColorIndex]);
                        bottomSetState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: selectedColorIndex == index
                              ? Border.all(
                                  width: 2, color: ColorConstants.mainRed)
                              : null,
                          color: colorsList[index],
                        ),
                        width: 60,
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          NoteScreenController.clearControllers();

                          Navigator.pop(context);

                          // bottomSetState(() {});
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConstants.mainLightGrey,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            child: Center(child: Text("Cancel"))),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            widget.onSavePressed!();
                          }
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConstants.mainLightGrey,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            child: Center(
                                child:
                                    Text(widget.isEdit ? "Update" : "Save"))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
