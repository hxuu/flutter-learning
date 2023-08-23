import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failure.dart';

Map<String, AuthError> authErrorMapping = {
  'user-not-found': AuthErrorUserNotFound(),
  'weak-password': AuthErrorWeakPassword(),
  'invalid-email': AuthErrorInvalidEmail(),
  'operation-not-allowed': AuthErrorOperationNotAllowed(),
  'email-already-in-use': AuthErrorEmailAlreadyInUse(),
  'requires-recent-login': AuthErrorRequiresRecentLogin(),
  'no-current-user': AuthErrorNoCurrentUser(),
};

class AuthError extends Failure {
  final String title;
  final String message;

  AuthError({
    required this.title,
    required this.message,
  }) : super([title, message]);

  factory AuthError.from(FirebaseAuthException exception) =>
      authErrorMapping[exception.code] ?? AuthErrorUnknown();
}

@immutable
class AuthErrorUnknown extends AuthError {
  AuthErrorUnknown()
      : super(
          title: 'Authentication error',
          message: 'Unknown authentication error',
        );
}

// auth/no-current-user

@immutable
class AuthErrorNoCurrentUser extends AuthError {
  AuthErrorNoCurrentUser()
      : super(
          title: 'No current user!',
          message: 'No current user with this information was found!',
        );
}

// auth/requires-recent-login

@immutable
class AuthErrorRequiresRecentLogin extends AuthError {
  AuthErrorRequiresRecentLogin()
      : super(
          title: 'Requires recent login',
          message:
              'You need to log out and log back in again in order to perform this operation',
        );
}

// auth/operation-not-allowed

@immutable
class AuthErrorOperationNotAllowed extends AuthError {
  AuthErrorOperationNotAllowed()
      : super(
          title: 'Operation not allowed',
          message: 'You cannot register using this method at this moment!',
        );
}

// auth/user-not-found

@immutable
class AuthErrorUserNotFound extends AuthError {
  AuthErrorUserNotFound()
      : super(
          title: 'User not found',
          message: 'The given user was not found on the server!',
        );
}

// auth/weak-password

@immutable
class AuthErrorWeakPassword extends AuthError {
  AuthErrorWeakPassword()
      : super(
          title: 'Weak password',
          message:
              'Please choose a stronger password consisting of more characters!',
        );
}

// auth/invalid-email

@immutable
class AuthErrorInvalidEmail extends AuthError {
  AuthErrorInvalidEmail()
      : super(
          title: 'Invalid email',
          message: 'Please double check your email and try again!',
        );
}

// auth/email-already-in-use

@immutable
class AuthErrorEmailAlreadyInUse extends AuthError {
  AuthErrorEmailAlreadyInUse()
      : super(
          title: 'Email already in use',
          message: 'Please choose another email to register with!',
        );
}
