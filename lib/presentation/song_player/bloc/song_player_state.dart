part of 'song_player_cubit.dart';

@immutable
sealed class SongPlayerState {}

final class SongPlayerLoading extends SongPlayerState {}
final class SongPlayerSuccess extends SongPlayerState {}
final class SongPlayerFailure extends SongPlayerState {}
