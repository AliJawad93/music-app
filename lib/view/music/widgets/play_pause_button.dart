import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/const/app_icons.dart';
import 'package:app/controller/slider_music_controller.dart';

class PlayPauseButton extends StatefulWidget {
  double padding;
  PlayPauseButton({
    Key? key,
    this.padding = 15,
  }) : super(key: key);

  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  bool isPlay = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayMusicController>(
        init: PlayMusicController(),
        builder: (playMusicController) {
          return OutlinedButton(
            onPressed: () {
              if (playMusicController.getIsPlay == false) {
                playMusicController.getAudioPlayer.play();
                playMusicController.setIsPlay(true);
              } else {
                playMusicController.getAudioPlayer.pause();
                playMusicController.setIsPlay(false);
              }
            },
            child:
                playMusicController.getIsPlay ? AppIcons.pause : AppIcons.play,
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              shape: const CircleBorder(),
              padding: EdgeInsets.all(widget.padding),
              side: const BorderSide(width: 1.0, color: Colors.white),
            ),
          );
        });
  }
}
