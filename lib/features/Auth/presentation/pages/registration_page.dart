import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

import '../widgets/background.dart';
import '../widgets/form.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: FormBefore(),
    );
  }
}

class FormBefore extends StatelessWidget {
  const FormBefore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'SkyChat',
            style: TextStyle(
              fontFamily: AppFont.logoFont.fontFamily,
              fontSize: 30,
              color: AppColor.complimentary,
            ),
          ),
          const SizedBox(height: defaultPadding * 2),
          const Row(
            children: [
              Spacer(),
              Expanded(
                flex: 8,
                child: AuthForm(
                  promptText: 'SIGN UP',
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
