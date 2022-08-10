import 'package:app/const/app_icons.dart';
import 'package:app/controller/slider_music_controller.dart';
import 'package:app/view/music/widgets/custom_icon_button.dart';
import 'package:app/view/music/widgets/play_pause_button.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonsTail extends StatefulWidget {
  CustomButtonsTail({Key? key}) : super(key: key);

  @override
  State<CustomButtonsTail> createState() => _CustomButtonsTailState();
}

class _CustomButtonsTailState extends State<CustomButtonsTail> {
  final PlayMusicController _playMusicController =
      Get.put(PlayMusicController());
  List<Icon> statusMusicIcons = [
    AppIcons.repeat,
    AppIcons.repeatOne,
    AppIcons.shuffling,
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayMusicController>(
        init: PlayMusicController(),
        builder: (_playMusicController) {
          return Container(
            height: Get.height * 0.2,
            margin: EdgeInsets.only(bottom: Get.height * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () {
                    _playMusicController.updateCountClickButton();
                  },
                  child: statusMusicIcons[
                      _playMusicController.getCountClicksButton],
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    shape: const CircleBorder(),
                    side: const BorderSide(width: 0, color: Colors.transparent),
                    padding: const EdgeInsets.all(5),
                  ),
                ),
                CustomIconButton(
                  icon: AppIcons.previous,
                  onPressed: () {
                    _playMusicController.previosSong();
                  },
                ),
                PlayPauseButton(),
                CustomIconButton(
                  icon: AppIcons.next,
                  onPressed: () {
                    _playMusicController.nextSong();
                  },
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: AppIcons.list,
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(5),
                    side: const BorderSide(width: 0, color: Colors.transparent),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
