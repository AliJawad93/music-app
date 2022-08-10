import 'package:app/controller/slider_music_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomWavesOver extends StatelessWidget {
  CustomWavesOver({Key? key, required this.imagePath}) : super(key: key);
  String imagePath;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayMusicController>(
        init: PlayMusicController(),
        builder: (_playMusicController) {
          return Container(
            height: Get.height * 0.2,
            decoration: BoxDecoration(
                border: const Border(
                  bottom: BorderSide(color: Color(0xff665f94), width: 1),
                ),
                color: const Color(0xff342c52).withOpacity(0.5)),
            child: OverflowBox(
                maxHeight: Get.height,
                minHeight: Get.height,
                child: Lottie.asset(imagePath,
                    animate: _playMusicController.getIsPlay ? true : false)),
          );
        });
  }
}
