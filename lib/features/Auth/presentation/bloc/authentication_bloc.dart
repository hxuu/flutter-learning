import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/error_entity.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/register.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login usecaseLogin;
  final Register usecaseRegister;

  AuthBloc({
    required this.usecaseLogin,
    required this.usecaseRegister,
  }) : super(
          LoggedOutState(),
        ) {
    on<AuthEventInitialize>(
      (event, emit) {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          emit(
            LoggedOutState(),
          );
        } else {
          emit(
            LoggedInState(
              user: user,
            ),
          );
        }
      },
    );

    on<RegisterEvent>(
      (event, emit) async {
        // emit(
        //   LoadingState(),
        // );
        final operation = await usecaseRegister(
          Params(
            email: event.email,
            password: event.password,
          ),
        );

        // check if operation is successful or not
        operation.fold(
          (failure) {
            if (failure is AuthError) {
              emit(
                AuthErrorState(
                  title: failure.title,
                  message: failure.message,
                ),
              );
            }
          },
          (user) {
            emit(
              LoggedInState(
                user: user,
              ),
            );
          },
        );
      },
    );
  }
}
