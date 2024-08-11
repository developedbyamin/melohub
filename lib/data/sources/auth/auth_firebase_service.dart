import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:melohub/data/models/auth/create_user_req.dart';
import 'package:melohub/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserReq createUserReq);
  Future<Either> signIn(SignInUserReq signInUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signIn(SignInUserReq signInUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInUserReq.email,
        password: signInUserReq.password,
      );
      return const Right('Sign in was succsessful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if(e.code == 'invalid-email'){
        message = 'The email is wrong!';
      } else if (e.code == 'invalid-credential'){
        message = 'The password is wrong!';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    try {
      var data =await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      FirebaseFirestore.instance.collection('Users').add({
        'name': createUserReq.fullName,
        'email': data.user?.email,
      });

      return const Right('Sign up was succsessful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if(e.code == 'weak-password'){
        message = 'The password provided is too weak!';
      } else if (e.code == 'email-already-in-use'){
        message = 'This mail is already in use!';
      }
      return Left(message);
    }
  }
}
