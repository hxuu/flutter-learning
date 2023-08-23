import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/authentication_bloc.dart';

import '../../../../core/theme/theme.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    Key? key,
    required this.promptText,
  }) : super(key: key);

  final String promptText;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(
              fontFamily: AppFont.spaceGrotesk.fontFamily,
            ),
            keyboardAppearance: Brightness.dark,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: AppColor.dominant,
            controller: emailController,
            decoration: InputDecoration(
              hintText: "*Email",
              hintStyle: TextStyle(
                fontFamily: AppFont.spaceGrotesk.fontFamily,
              ),
              prefixIcon: const Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person_4),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              obscuringCharacter: '*',
              keyboardAppearance: Brightness.dark,
              cursorColor: AppColor.accent,
              decoration: InputDecoration(
                hintText: "*Password",
                hintStyle: TextStyle(
                  fontFamily: AppFont.spaceGrotesk.fontFamily,
                ),
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.vpn_key),
                ),
                suffixIcon: const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.visibility_off),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              context.read<AuthBloc>().add(
                    RegisterEvent(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            child: Text(
              widget.promptText,
              style: TextStyle(
                color: AppColor.complimentary,
                fontFamily: AppFont.spaceGrotesk.fontFamily,
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: TextStyle(
                  color: AppColor.complimentary,
                  fontFamily: AppFont.spaceGrotesk.fontFamily,
                ),
              ),
              Text(
                widget.promptText == 'SIGN IN' ? 'Sign Up' : 'Sign In',
                style: TextStyle(
                  color: AppColor.complimentary,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFont.spaceGrotesk.fontFamily,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
