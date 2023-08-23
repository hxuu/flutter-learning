import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> register({
    required String email,
    required String password,
  });
  // Future<Either<Failure, void>>? logout();
}
