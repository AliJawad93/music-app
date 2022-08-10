import 'package:flutter/material.dart';

import 'package:app/const/app_colors.dart';

class CustomIconButton extends StatefulWidget {
  Icon icon;
  Function() onPressed;
  double width;
  double padding;

  CustomIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.width = 0.5,
    this.padding = 5,
  }) : super(key: key);

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: widget.onPressed,
      child: widget.icon,
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        shape: const CircleBorder(),
        padding: EdgeInsets.all(widget.padding),
        side: BorderSide(width: widget.width, color: AppColors.outLineButton),
      ),
    );
  }
}
