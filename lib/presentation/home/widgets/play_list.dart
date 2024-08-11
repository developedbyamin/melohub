import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melohub/common/helpers/is_dark_mode.dart';
import 'package:melohub/core/configs/theme/app_colors.dart';
import '../../../domain/entities/song/song.dart';
import '../../song_player/pages/song_player.dart';
import '../bloc/play_list_cubit.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayListCubit()..getPlayList(),
      child: BlocBuilder<PlayListCubit, PlayListState>(
        builder: (context, state) {
          if (state is PlayListLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(color: AppColors.primary,),
            );
          }
          if (state is PlayListSuccess) {
            return Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Playlist',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'see more',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 16,),
                _songs(state.songs),
              ],
            );
          }

          return Container();
        },
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => SongPlayerPage(songEntity: songs[index],)));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.isDarkMode ? AppColors.greyDark : Colors.white,
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      color: context.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(songs[index].title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                      const SizedBox(height: 8,),
                      Text(songs[index].artist, style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(songs[index].duration.toString().replaceAll('.', ':'),),
                  const SizedBox(width: 8,),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline, color: Colors.grey, size: 32,),),
                ],
              ),
            ]
          ),
        );
      },
      separatorBuilder: (context,index) => const SizedBox(height: 16,),
      itemCount: songs.length,
    );
  }
}
