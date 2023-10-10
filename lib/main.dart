import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'helpers/app_localization.dart';
import 'helpers/route_helper.dart';
import 'screens/splash_screen.dart';
import 'screens/video_home/home_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Latest Movie Intro',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: const HomeVideoScreen(),
      routes: RouteHelper.routes,
    );
  }
}
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

