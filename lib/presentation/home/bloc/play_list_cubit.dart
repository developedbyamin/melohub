import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melohub/domain/usecases/song/get_play_list.dart';
import '../../../domain/entities/song/song.dart';
import '../../../service_locator.dart';

part 'play_list_state.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async{
    var returnedSongs = await sl<GetPlayListUseCase>().call();
    returnedSongs.fold(
          (l) {
        emit(PlayListFailure());
      },
          (data) {
        emit(PlayListSuccess(songs: data));
      },
    );
  }

}
