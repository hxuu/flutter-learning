import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class Register implements UseCase<User, Params> {
  final AuthenticationRepository repository;

  Register(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.register(
      email: params.email,
      password: params.password,
    );
  }
}
