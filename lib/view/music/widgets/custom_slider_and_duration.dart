import 'package:app/controller/slider_music_controller.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class CustomSliderAndDuration extends StatefulWidget {
  CustomSliderAndDuration({Key? key}) : super(key: key);

  @override
  State<CustomSliderAndDuration> createState() =>
      _CustomSliderAndDurationState();
}

class _CustomSliderAndDurationState extends State<CustomSliderAndDuration> {
  PlayMusicController _playMusicController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayMusicController>(
        init: PlayMusicController(),
        builder: (_playMusicController) {
          return Container(
            height: Get.height * 0.1,
            margin: EdgeInsets.only(
                top: Get.height * 0.03,
                left: Get.width * 0.1,
                right: Get.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 2.0,
                    trackShape: const RectangularSliderTrackShape(),
                    overlayShape: SliderComponentShape.noThumb,
                    thumbShape: const RectThumbShape(),
                  ),
                  child: Slider(
                    activeColor: const Color(0xff70d7f5),
                    inactiveColor: const Color(0xff251c43),
                    value:
                        _playMusicController.getPosition.inSeconds.toDouble(),
                    onChanged: (val) {
                      _playMusicController.changePostion(val.toInt());
                    },
                    min: const Duration(microseconds: 0).inSeconds.toDouble(),
                    max: _playMusicController.getDuration.inSeconds.toDouble(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getDurationClear(
                          _playMusicController.getPosition.toString()),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      getDurationClear(
                          _playMusicController.getDuration.toString()),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }

  String getDurationClear(String duration) {
    String d;
    if (duration[2] == "0") {
      d = duration.substring(3, 7);
    } else if (duration[2] != "0" && duration[0] == "0") {
      d = duration.substring(2, 7);
    } else {
      d = duration.substring(0, 7);
    }

    return d;
  }
}

class RectThumbShape extends SliderComponentShape {
  final Size size;

  const RectThumbShape({
    this.size = const Size(7, 18),
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return size;
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    final fillPaint = Paint()
      ..shader = ui.Gradient.linear(
        const Offset(83, 116),
        const Offset(53, 1),
        [
          const Color(0xff5dc6ff),
          const Color(0xffa376e9),
        ],
      )
      ..style = PaintingStyle.fill;

    canvas.drawRect((center + const Offset(-6, -9)) & size, fillPaint);
  }
}
