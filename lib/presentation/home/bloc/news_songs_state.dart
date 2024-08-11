part of 'news_songs_cubit.dart';

@immutable
sealed class NewsSongsState {}

final class NewsSongsLoading extends NewsSongsState {}
final class NewsSongSuccess extends NewsSongsState {
  final List<SongEntity> songs;

  NewsSongSuccess({required this.songs});

}
final class NewsSongsFailure extends NewsSongsState {}
