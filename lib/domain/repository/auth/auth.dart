import 'package:dartz/dartz.dart';
import 'package:melohub/data/models/auth/create_user_req.dart';
import 'package:melohub/data/models/auth/signin_user_req.dart';

abstract class AuthRepository{
  Future<Either> signUp(CreateUserReq createUserReq);

  Future<Either> signIn(SignInUserReq signInUserReq);
}