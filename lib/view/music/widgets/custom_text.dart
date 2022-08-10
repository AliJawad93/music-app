import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {Key? key, required this.text, this.maxLines = 1, required this.fontSize})
      : super(key: key);
  String text;
  int maxLines;
  double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      overflow: TextOverflow.fade,
      maxLines: maxLines,
      softWrap: true,
      style: TextStyle(color: Colors.white, fontSize: fontSize),
    );
  }
}
