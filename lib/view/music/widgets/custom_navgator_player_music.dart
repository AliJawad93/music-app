import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/controller/slider_music_controller.dart';
import 'package:app/view/music/widgets/custom_text.dart';
import 'package:app/view/music/widgets/custom_vinyl.dart';
import 'package:app/view/music/widgets/play_pause_button.dart';

import '../screen/play_music.dart';

class NavgButtomPlayerMusic extends StatelessWidget {
  const NavgButtomPlayerMusic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayMusicController>(
      init: PlayMusicController(),
      builder: (controller) {
        if (controller.getCurrentIndex != -1) {
          return Container(
            height: Get.height * 0.08,
            width: Get.width,
            decoration: const BoxDecoration(
              color: Color(0xff342c52),
              border: Border(
                top: BorderSide(color: Color(0xff665f94), width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomVinyl(
                  iamgeHight: 0,
                  imageWidth: 0,
                  vinylHight: 50,
                  vinylWidth: 50,
                  sizeIcon: 0,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const PlayMusic());
                  },
                  child: SizedBox(
                      width: Get.width * 0.5,
                      child: CustomText(
                        text: controller
                            .getSongs![controller.getCurrentIndex].title,
                        fontSize: 15,
                      )),
                ),
                Container(
                  width: Get.width * 0.3,
                  height: Get.height * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        child: const Icon(
                          Icons.skip_previous,
                          size: 25,
                        ),
                        onTap: () {
                          controller.previosSong();
                        },
                      ),
                      PlayPauseButton(
                        padding: 5,
                      ),
                      InkWell(
                        child: const Icon(
                          Icons.skip_next,
                          size: 25,
                        ),
                        onTap: () {
                          controller.nextSong();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
