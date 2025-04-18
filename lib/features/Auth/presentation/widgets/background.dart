import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
    this.topImage = "assets/images/main_top.png",
    this.bottomImage = "assets/images/login_bottom.png",
  }) : super(key: key);

  final String topImage, bottomImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.dominant,
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  topImage,
                  width: 120,
                  color: AppColor.complimentary,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  bottomImage,
                  width: 120,
                  color: AppColor.complimentary,
                ),
              ),
            ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
