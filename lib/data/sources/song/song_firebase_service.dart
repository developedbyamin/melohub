import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:melohub/data/models/song/song.dart';
import 'package:melohub/domain/entities/song/song.dart';

abstract class SongFirebaseService{
  Future<Either> getNewsSongs();
  Future<Either> getPlaylist();
}

class SongFirebaseServiceImpl extends SongFirebaseService{
  @override
  Future<Either> getNewsSongs() async {
    try{
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance.collection('songs').orderBy('releaseDate',descending: true).limit(3).get();
      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e){
      return const Left('An error occurred');
    }
  }

  @override
  Future<Either> getPlaylist() async {
    try{
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance.collection('songs').orderBy('releaseDate',descending: true).get();
      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e){
      return const Left('An error occurred');
    }
  }
}