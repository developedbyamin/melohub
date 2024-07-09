import 'package:melohub/data/sources/auth/auth_firebase_service.dart';
import 'package:melohub/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUp() async {
    // await sl<AuthFirebaseService>().signUp(createUserReq);
  }

}