import 'package:flutter/material.dart';
import 'package:todo_dec/utils/constants/color_constants.dart';

class CustomNotesWidget extends StatefulWidget {
  const CustomNotesWidget(
      {super.key,
      required this.title,
      required this.des,
      required this.date,
      required this.noteColor,
      this.onDeletePressed});

  final String title;
  final String des;
  final String date;
  final Color noteColor;

  final void Function()? onDeletePressed;

  @override
  State<CustomNotesWidget> createState() => _CustomNotesWidgetState();
}

class _CustomNotesWidgetState extends State<CustomNotesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: widget.noteColor, borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.mainBlack,
                    fontSize: 22),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // implement edit functinoality here
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: widget.onDeletePressed,
                  ),
                ],
              ),
            ],
          ),
          Text(
            widget.des,
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: ColorConstants.mainBlack,
                fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.date,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.mainBlack,
                    fontSize: 16),
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
