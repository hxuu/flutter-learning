import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class Login implements UseCase<User, Params> {
  final AuthenticationRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.login(
      email: params.email,
      password: params.password,
    );
  }
}
