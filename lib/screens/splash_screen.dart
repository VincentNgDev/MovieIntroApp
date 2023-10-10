import 'package:flutter/material.dart';

import '../helpers/color_pick.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorPick.white,
        child: const Center(
          child: Text('Splash Screen'),
        ),
      ),
    );
  }
}
