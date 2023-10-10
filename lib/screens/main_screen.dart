import 'package:flutter/material.dart';

import '../helpers/color_pick.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorPick.white,
        width: double.infinity,
        child: const Center(
          child: Text('Main Screen'),
        ),
      ),
    );
  }
}
