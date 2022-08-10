import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:app/const/app_images_path.dart';
import 'package:app/controller/slider_music_controller.dart';
import 'package:app/view/music/widgets/custom_container_image.dart';

class CustomVinyl extends StatefulWidget {
  double vinylHight;
  double vinylWidth;
  double iamgeHight;
  double imageWidth;
  double sizeIcon;
  CustomVinyl({
    Key? key,
    required this.vinylHight,
    required this.vinylWidth,
    required this.iamgeHight,
    required this.imageWidth,
    required this.sizeIcon,
  }) : super(key: key);

  @override
  State<CustomVinyl> createState() => _CustomVinylState();
}

class _CustomVinylState extends State<CustomVinyl>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    initAnimationController();
    super.initState();
  }

  initAnimationController() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 15));

    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _animationController.repeat();
      }
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayMusicController>(
        init: PlayMusicController(),
        builder: (_playMusicController) {
          return RotationTransition(
            turns: _playMusicController.getIsPlay
                ? Tween(begin: 0.0, end: 1.0).animate(_animationController)
                : Tween(begin: 0.0, end: 0.0).animate(_animationController),
            child: CustomContainerImage(
              height: widget.vinylHight,
              width: widget.vinylWidth,
              imagePath: AppImagePath.vinyl,
              child: CustomContainerImage(
                height: widget.iamgeHight,
                width: widget.imageWidth,
                imagePath: null,
                child: QueryArtworkWidget(
                    id: _playMusicController
                        .getSongs![_playMusicController.getCurrentIndex].id,
                    type: ArtworkType.AUDIO,
                    nullArtworkWidget: Container(
                      height: 110,
                      width: 110,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Icon(
                        Icons.music_note,
                        size: widget.sizeIcon,
                        color: Colors.black,
                      ),
                    )),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
