import 'package:app/view/music/widgets/custom_card_music.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/controller/slider_music_controller.dart';

import '../../../const/app_colors.dart';
import '../screen/play_music.dart';

class ListViewMusic extends StatelessWidget {
  ListViewMusic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayMusicController>(
      init: PlayMusicController(),
      builder: (controller) {
        return Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.gradientBgDarkPurple,
                AppColors.gradientBgMoreDarkPurple,
              ],
            ),
          ),
          child: Scrollbar(
            radius: const Radius.circular(30),
            thickness: 7,
            interactive: true,
            child: ListView.builder(
              itemCount:
                  controller.getSongs == null ? 0 : controller.getSongs!.length,
              itemBuilder: (context, index) {
                return CustomCardMusic(
                  onTap: () {
                    controller.setIsPlay(true);
                    controller.playSong(controller.getSongs![index], index);
                    controller.setCurrentIndex(index);
                    Get.to(() => const PlayMusic());
                  },
                  song: controller.getSongs![index],
                  currentIndex: index,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
