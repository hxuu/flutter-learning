import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'features/Auth/presentation/bloc/authentication_bloc.dart';

import 'features/Auth/data/datasources/remote_data_sources.dart';
import 'features/Auth/data/repositories/auth_repository_impl.dart';
import 'features/Auth/domain/repositories/auth_repository.dart';
import 'features/Auth/domain/usecases/login.dart';
import 'features/Auth/domain/usecases/register.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => AuthBloc(
      usecaseLogin: sl(),
      usecaseRegister: sl(),
      // logout: sl(),
    ),
  );

  // use cases
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => Register(sl()));
  // sl.registerLazySingleton(() => Logout(sl()));

  // Repository
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(
      firebaseAuth: sl(),
    ),
  );

  // External
  sl.registerLazySingleton(() => FirebaseAuth.instance);
}
