import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

part 'song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {

  final AudioPlayer audioPlayer = AudioPlayer();

  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  SongPlayerCubit() : super(SongPlayerLoading()) {
    audioPlayer.positionStream.listen((position) {
      songPosition = position;
      updateSongPlayer();
    });

    audioPlayer.durationStream.listen((duration) {
      if (duration != null) {
        songDuration = duration;
      }
    });
  }

  void updateSongPlayer() {
    emit(SongPlayerSuccess());
  }

  Future<void> loadSong(String url) async {
    emit(SongPlayerLoading()); // Emit loading state before loading the song
    try {
      await audioPlayer.setUrl(url);
      emit(SongPlayerSuccess());
    } catch (e) {
      emit(SongPlayerFailure());
    }
  }

  Future<void> playOrPauseSong() async {
    if (audioPlayer.playing) {
      await audioPlayer.pause(); // Pause instead of stop
    } else {
      await audioPlayer.play();
    }
    emit(SongPlayerSuccess());
  }

  Future<void> seekTo(Duration position) async {
    await audioPlayer.seek(position);
    emit(SongPlayerSuccess());
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
