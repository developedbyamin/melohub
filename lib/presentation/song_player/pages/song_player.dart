import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melohub/common/widgets/appbar/app_bar.dart';
import 'package:melohub/core/configs/helpers/helper_functions.dart';
import 'package:melohub/core/configs/theme/app_colors.dart';
import 'package:melohub/domain/entities/song/song.dart';
import 'package:melohub/presentation/song_player/bloc/song_player_cubit.dart';
import '../../../core/configs/constants/app_urls.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity songEntity;
  const SongPlayerPage({super.key, required this.songEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppBar(
          title: const Text('Playing'),
          action: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ),
        body: BlocProvider(
          create: (_) => SongPlayerCubit()
            ..loadSong(
              '${AppUrls.songFireStorage}${songEntity.artist}-${songEntity.title}.mp3?${AppUrls.mediaAlt}',
            ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: HelperFunctions.screenWidth(context) * 0.05,
              ),
              child: Column(
                children: [
                  _songCover(context),
                  const SizedBox(
                    height: 16,
                  ),
                  _songDetail(),
                  const SizedBox(
                    height: 16,
                  ),
                  _songPlayer(context),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: HelperFunctions.screenHeight(context) / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            '${AppUrls.fireStorage}${songEntity.artist}-${songEntity.title}.jpg?${AppUrls.mediaAlt}',
          ),
        ),
      ),
    );
  }

  Widget _songDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              songEntity.artist,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_outline,
            color: Colors.grey,
            size: 32,
          ),
        ),
      ],
    );
  }

  Widget _songPlayer(BuildContext context) {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
      builder: (context, state) {
        if (state is SongPlayerLoading) {
          return const CircularProgressIndicator(
            color: AppColors.primary,
          );
        }
        if (state is SongPlayerSuccess) {
          return Column(
            children: [
              Slider(
                activeColor: AppColors.primary,
                value: context.read<SongPlayerCubit>().songPosition.inSeconds.toDouble(),
                min: 0.0,
                max: context.read<SongPlayerCubit>().songDuration.inSeconds.toDouble(),
                onChanged: (value) {}
              ),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatDuration(context.read<SongPlayerCubit>().songPosition)
                  ),
                  Text(
                      formatDuration(context.read<SongPlayerCubit>().songDuration)
                  )
                ],
              ),
              const SizedBox(height: 16,),
              GestureDetector(
                onTap: (){
                  context.read<SongPlayerCubit>().playOrPauseSong();
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: Icon(
                      context.read<SongPlayerCubit>().audioPlayer.playing ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }

  String formatDuration(Duration duration){
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}';
  }
}
