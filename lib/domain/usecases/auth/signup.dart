import 'package:dartz/dartz.dart';
import 'package:melohub/core/usecase/usecase.dart';
import 'package:melohub/data/models/auth/create_user_req.dart';
import 'package:melohub/domain/repository/auth/auth.dart';
import '../../../service_locator.dart';

class SignUpUseCase implements UseCase<Either,CreateUserReq>{
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signUp(params!);
  }
}