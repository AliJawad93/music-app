import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:on_audio_query/on_audio_query.dart';

enum STATUSMUSIC {
  shuffle,
  repeat,
  repeatOne,
}

class PlayMusicController extends GetxController {
  final _audioPlayer = AudioPlayer();
  List<SongModel>? _songs;

  int _currentIndex = -1;
  bool _isPlay = false;
  Duration _duration = const Duration();
  Duration _position = const Duration();
  bool isAllowToPass = true;
  STATUSMUSIC _myStatusMusic = STATUSMUSIC.repeat; //defuat value
  int _countClicksButton = 0;

  void updateCountClickButton() {
    ++_countClicksButton;
    if (_countClicksButton > 2) {
      _countClicksButton = 0;
    }
    setStatusMusic();
    update();
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    update();
  }

  void setSongs(List<SongModel>? mysongs) {
    _songs = mysongs;
    update();
  }

  void setIsPlay(bool status) {
    _isPlay = status;
    update();
  }

  void setStatusMusic() {
    if (getCountClicksButton == 0) {
      _myStatusMusic = STATUSMUSIC.repeat;
      print("[[[[[[[[[ 0 ]]]]]]]]]");
    } else if (getCountClicksButton == 1) {
      print("[[[[[[[[[ 1 ]]]]]]]]]");
      _myStatusMusic = STATUSMUSIC.repeatOne;
    } else if (getCountClicksButton == 2) {
      print("[[[[[[[[[ 0 ]]]]]]]]]");
      _myStatusMusic = STATUSMUSIC.shuffle;
    }
  }

  changePostion(int seconds) {
    Duration position = Duration(seconds: seconds);
    _audioPlayer.seek(position);
    update();
  }

  _play(SongModel song) {
    try {
      _audioPlayer.setAudioSource(
        AudioSource.uri(
          Uri.parse(song.uri!),
          tag: MediaItem(
            // Specify a unique ID for each media item:
            id: song.id.toString(),
            // Metadata to display in the notification:
            album: song.album,
            title: song.title,
            artUri: Uri.parse('https://example.com/albumart.jpg'),
          ),
        ),
      );
      _audioPlayer.play();

      _audioPlayer.durationStream.listen((duration) {
        _duration = duration!;
        update();
      });

      _audioPlayer.positionStream.listen((position) {
        _position = position;
        update();
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void playSong(SongModel song, int index) {
    if (getCurrentIndex != index) {
      _play(song);
    } else {
      getAudioPlayer.play();
    }
  }

  void nextSong() {
    print("[[[[[[[[[[[[[[ INSIDE NEXT SONG ]]]]]]]]]]]]]]]");
    int index = getCurrentIndex;
    int firstIndexSong = 0;
    int lastIndexSong = getSongs!.length - 1;

    if (index + 1 > lastIndexSong) {
      setCurrentIndex(firstIndexSong);
    } else {
      setCurrentIndex(++index);
    }
    _isPlay = true;
    _play(getSongs![getCurrentIndex]);
  }

  void previosSong() {
    int index = getCurrentIndex;
    int firstIndexSong = 0;
    int lastIndexSong = getSongs!.length - 1;

    if (index - 1 < firstIndexSong) {
      setCurrentIndex(lastIndexSong);
    } else {
      setCurrentIndex(--index);
    }
    _isPlay = true;

    _play(getSongs![getCurrentIndex]);
  }

  whenFinishGoToNextSong() {
    _audioPlayer.playerStateStream.listen((playerState) {
      //final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.completed) {
        statusMusic(getStatusMusic);
      }
    });
  }

  statusMusic(STATUSMUSIC statusmusic) {
    switch (statusmusic) {
      case STATUSMUSIC.repeat:
        repeat();
        break;
      case STATUSMUSIC.repeatOne:
        repeatOne();
        break;
      case STATUSMUSIC.shuffle:
        shuffle();
        break;
      default:
    }
  }

  void repeat() {
    nextSong();
  }

  void repeatOne() {
    _audioPlayer.loopMode;
  }

  void shuffle() {
    var rng = Random();
    int index = rng.nextInt(getSongs!.length);
    _play(getSongs![index]);
  }

  // ehfoivh
  AudioPlayer get getAudioPlayer => _audioPlayer;
  bool get getIsPlay => _isPlay;
  Duration get getDuration => _duration;
  Duration get getPosition => _position;
  int get getCurrentIndex => _currentIndex;
  List<SongModel>? get getSongs => _songs;
  STATUSMUSIC get getStatusMusic => _myStatusMusic;
  int get getCountClicksButton => _countClicksButton;
}
