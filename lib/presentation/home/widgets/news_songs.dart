import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melohub/common/helpers/is_dark_mode.dart';
import 'package:melohub/core/configs/helpers/helper_functions.dart';
import 'package:melohub/core/configs/theme/app_colors.dart';
import 'package:melohub/presentation/home/bloc/news_songs_cubit.dart';
import 'package:melohub/presentation/home/widgets/play_list.dart';
import 'package:melohub/presentation/song_player/pages/song_player.dart';

import '../../../core/configs/constants/app_urls.dart';
import '../../../domain/entities/song/song.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
        builder: (context, state) {
          if (state is NewsSongsLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(color: AppColors.primary,),
            );
          }
          if (state is NewsSongSuccess) {
            return _songs(state.songs);
          }
          return Container(
            color: Colors.red,
          );
        },
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => SongPlayerPage(songEntity: songs[index],),),);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: HelperFunctions.screenWidth(context) * 0.35,
                      height: HelperFunctions.screenHeight(context) * 0.3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              '${AppUrls.fireStorage}${songs[index].artist}-${songs[index].title}.jpg?${AppUrls.mediaAlt}',
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 40,
                            width: 40,
                            transform: Matrix4.translationValues(10, 10, 0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.isDarkMode ? AppColors.greyDark : Colors.grey,
                            ),
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text(songs[index].title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    const SizedBox(height: 8,),
                    Text(songs[index].artist, style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
            itemCount: songs.length,
          ),
        ),
        const SizedBox(height: 8,),
        const PlayList(),
      ],
    );
  }

}
