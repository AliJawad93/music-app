import 'package:flutter/material.dart';

class CustomContainerImage extends StatelessWidget {
  Widget? child;
  String? imagePath;
  double height;
  double width;

  CustomContainerImage({
    Key? key,
    this.child,
    required this.imagePath,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 2, bottom: 2),
      child: child,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: imagePath == null
            ? null
            : DecorationImage(
                image: AssetImage(imagePath!),
                fit: BoxFit.fill,
              ),
      ),
    );
  }
}
