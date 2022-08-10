import 'package:app/const/app_colors.dart';
import 'package:app/view/music/widgets/custom_buttons.dart';
import 'package:app/view/music/widgets/custom_slider_and_duration.dart';
import 'package:app/view/music/widgets/custom_text.dart';
import 'package:app/view/music/widgets/custom_vinyl.dart';
import 'package:app/view/music/widgets/custom_waves_over.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/const/app_images_path.dart';
import 'package:app/controller/slider_music_controller.dart';

class PlayMusic extends StatefulWidget {
  const PlayMusic({
    Key? key,
  }) : super(key: key);

  @override
  State<PlayMusic> createState() => _PlayMusicState();
}

class _PlayMusicState extends State<PlayMusic> {
  PlayMusicController _playMusicController = Get.put(PlayMusicController());
  @override
  void initState() {
    _playMusicController.whenFinishGoToNextSong();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff3c3460),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Music Player"),
        ),
        body: Stack(
          children: [
            Container(
                height: Get.height,
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.gradientBgDarkPurple,
                      AppColors.gradientBgMoreDarkPurple,
                      // Color(0xff413662),
                      // Color(0xff251e3b),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomVinyl(
                      iamgeHight: 110,
                      imageWidth: 110,
                      vinylHight: 300,
                      vinylWidth: 300,
                      sizeIcon: 50,
                    ),
                    CustomSliderAndDuration(),
                    GetBuilder<PlayMusicController>(
                        init: PlayMusicController(),
                        builder: (controller) {
                          return CustomText(
                              fontSize: 20,
                              text: controller
                                  .getSongs![controller.getCurrentIndex].title);
                        }),
                    CustomButtonsTail(),
                  ],
                )),
            CustomWavesOver(imagePath: AppImagePath.waves)
          ],
        ));
  }
}
