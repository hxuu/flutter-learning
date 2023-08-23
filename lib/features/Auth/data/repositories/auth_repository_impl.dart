import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/error_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote_data_sources.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;

  AuthenticationRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.login(
        email: email,
        password: password,
      );

      return Right(user);
    } on FirebaseAuthException catch (e) {
      final authError = AuthError.from(e);
      return Left(authError);
    }
  }

  @override
  Future<Either<Failure, User>> register({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.register(
        email: email,
        password: password,
      );

      return Right(user);
    } on FirebaseAuthException catch (e) {
      final authError = AuthError.from(e);
      return Left(authError);
    }
  }
}
