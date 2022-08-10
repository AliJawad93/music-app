import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:app/const/app_colors.dart';
import 'package:app/controller/slider_music_controller.dart';

class CustomCardMusic extends StatefulWidget {
  SongModel song;
  Function() onTap;
  int currentIndex;
  CustomCardMusic({
    Key? key,
    required this.song,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);
  @override
  State<CustomCardMusic> createState() => _CustomCardMusicState();
}

class _CustomCardMusicState extends State<CustomCardMusic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.04,
      ),
      child: GetBuilder<PlayMusicController>(
          init: PlayMusicController(),
          builder: (playMusicController) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                onTap: widget.onTap,
                leading: QueryArtworkWidget(
                    id: widget.song.id,
                    type: ArtworkType.AUDIO,
                    nullArtworkWidget: Container(
                      height: Get.height * 0.06,
                      width: Get.width * 0.13,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.music_note,
                        size: 20,
                      ),
                    )),
                title: Text(
                  widget.song.title,
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  softWrap: true,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 15),
                ),
                subtitle: Text(
                  widget.song.artist!,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(100.0),
                    bottomRight: Radius.circular(100.0),
                  ),
                  gradient:
                      playMusicController.getCurrentIndex != widget.currentIndex
                          ? null
                          : const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                AppColors.gradientSelectedMusicLightPurple,
                                AppColors.gradientSelectedMusicLightBlue,
                              ],
                            )),
            );
          }),
    );
  }
}
