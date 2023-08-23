import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRemoteDataSource {
  Future<User> login({
    required String email,
    required String password,
  });
  Future<User> register({
    required String email,
    required String password,
  });
  // Future<void> logout();
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthenticationRemoteDataSourceImpl({
    required this.firebaseAuth,
  });

  @override
  Future<User> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user!;
      return user;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  @override
  Future<User> register({
    required String email,
    required String password,
  }) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user!;
      return user;
    } catch (exception) {
      rethrow;
    }
  }
}
