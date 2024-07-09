import 'package:get_it/get_it.dart';
import 'package:melohub/data/repository/auth/auth_repository_impl.dart';
import 'package:melohub/data/sources/auth/auth_firebase_service.dart';
import 'package:melohub/domain/repository/auth/auth.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );

  sl.registerSingleton<AuthRepository>(
      AuthRepositoryImpl()
  );


}