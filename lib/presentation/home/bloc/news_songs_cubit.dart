import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melohub/domain/usecases/song/get_news_songs.dart';

import '../../../domain/entities/song/song.dart';
import '../../../service_locator.dart';

part 'news_songs_state.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async{
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();
    returnedSongs.fold(
        (l) {
          emit(NewsSongsFailure());
        },
        (data) {
          emit(NewsSongSuccess(songs: data));
        },
    );
  }
}
