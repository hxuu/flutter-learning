part of 'authentication_bloc.dart';

sealed class AuthState extends Equatable {
  final AuthError? authError;
  const AuthState({
    this.authError,
  });

  @override
  List<Object> get props => [];
}

@immutable
class InitialState extends AuthState {}

@immutable
class LoadingState extends AuthState {}

@immutable
class LoggedInState extends AuthState {
  final User user;

  const LoggedInState({
    required this.user,
  });
}

@immutable
class LoggedOutState extends AuthState {}

@immutable
class AuthErrorState extends AuthState {
  final String title;
  final String message;

  const AuthErrorState({
    required this.title,
    required this.message,
  });
}

extension GetUser on AuthState {
  User? get user {
    final cls = this;
    if (cls is LoggedInState) {
      return cls.user;
    }
    return null;
  }
}
