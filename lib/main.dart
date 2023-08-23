import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/theme.dart';
import 'features/Auth/presentation/pages/registration_page.dart';

import 'dependency_container.dart';
import 'features/Auth/presentation/bloc/authentication_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skychat App',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: AppColor.complimentary,
          hintStyle: TextStyle(
            color: AppColor.dominant,
          ),
          prefixIconColor: AppColor.dominant,
          suffixIconColor: AppColor.dominant,
          contentPadding: EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: defaultPadding,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => sl<AuthBloc>(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthErrorState) {
              AwesomeDialog(
                context: context,
                title: state.title,
                dialogBackgroundColor: AppColor.complimentary,
                desc: state.message,
                descTextStyle: TextStyle(
                  fontFamily: AppFont.spaceGrotesk.fontFamily,
                ),
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFont.spaceGrotesk.fontFamily,
                ),
                dialogType: DialogType.error,
                btnOkOnPress: () {},
                btnOkColor: Colors.black,
              ).show();
            }
          },
          builder: (context, state) {
            return const RegistrationPage();
          },
        ),
      ),
    );
  }
}
