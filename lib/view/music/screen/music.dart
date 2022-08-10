import 'package:app/const/app_colors.dart';
import 'package:app/const/app_icons.dart';
import 'package:app/const/app_images_path.dart';
import 'package:app/const/app_string.dart';
import 'package:app/controller/slider_music_controller.dart';
import 'package:app/utils/services/permissions.dart';
import 'package:app/view/music/screen/play_music.dart';
import 'package:app/view/music/widgets/custom_card_music.dart';
import 'package:app/view/music/widgets/custom_icon_button.dart';
import 'package:app/view/music/widgets/custom_text.dart';
import 'package:app/view/music/widgets/custom_vinyl.dart';
import 'package:app/view/music/widgets/play_pause_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../widgets/custom_list_view_music.dart';
import '../widgets/custom_navgator_player_music.dart';

class MusicPage extends StatefulWidget {
  MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final _audioQuery = OnAudioQuery();
  final PlayMusicController _playMusicController =
      Get.put(PlayMusicController());

  @override
  void initState() {
    AppPermission.getStorageRequest();
    super.initState();
  }

  Future<List<SongModel>> getSongs() async {
    List<SongModel> songs = await _audioQuery.querySongs(
        sortType: SongSortType.DATE_ADDED,
        orderType: OrderType.DESC_OR_GREATER,
        uriType: UriType.EXTERNAL);
    return songs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: false,
              snap: false,
              pinned: true,
              expandedHeight: 240,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(bottom: 20, left: 30),
                title: Text(AppString.music),
                background: Image.asset(
                  AppImagePath.musicBackGround,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: FutureBuilder<List<SongModel>>(
            future: getSongs(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _playMusicController.setSongs(snapshot.data);
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ListViewMusic(),
                    NavgButtomPlayerMusic(),
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
