import 'package:dartz/dartz.dart';
import 'package:melohub/data/models/auth/create_user_req.dart';
import 'package:melohub/data/models/auth/signin_user_req.dart';
import 'package:melohub/domain/repository/auth/auth.dart';
import 'package:melohub/data/sources/auth/auth_firebase_service.dart';

import '../../../service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SignInUserReq signInUserReq) async {
    return await sl<AuthFirebaseService>().signIn(signInUserReq);
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signUp(createUserReq);
  }
}
