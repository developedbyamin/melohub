import 'package:get_it/get_it.dart';
import 'package:melohub/data/repository/auth/auth_repository_impl.dart';
import 'package:melohub/data/repository/song/song_repository_impl.dart';
import 'package:melohub/data/sources/auth/auth_firebase_service.dart';
import 'package:melohub/data/sources/song/song_firebase_service.dart';
import 'package:melohub/domain/repository/auth/auth.dart';
import 'package:melohub/domain/repository/song/song.dart';
import 'package:melohub/domain/usecases/auth/signup.dart';
import 'package:melohub/domain/usecases/song/get_news_songs.dart';
import 'package:melohub/domain/usecases/song/get_play_list.dart';

import 'domain/usecases/auth/signin.dart';

final GetIt sl=GetIt.instance;

Future<void> initializeDependencies() async{
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );

  sl.registerSingleton<AuthRepository>(
      AuthRepositoryImpl()
  );

  sl.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl(),
  );

  sl.registerSingleton<SongRepository>(
    SongRepositoryImpl(),
  );

  sl.registerSingleton<SignUpUseCase>(
      SignUpUseCase()
  );

  sl.registerSingleton<SignInUseCase>(
      SignInUseCase(),
  );

  sl.registerSingleton<GetNewsSongsUseCase>(
      GetNewsSongsUseCase()
  );

  sl.registerSingleton<GetPlayListUseCase>(
      GetPlayListUseCase()
  );


}