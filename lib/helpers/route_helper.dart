import 'package:flutter/material.dart';

import '../screens/shared/unknown_screen.dart';

class RouteHelper {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    /// Routes
    if (settings.name != null) {
      /// Check Setting Name
      debugPrint('This Setting Name ${settings.name}');

      /// Get Route Name
      /// Parsing Route Name
      /// Create a function to handle the route for specific screen
      
      // String routeName = '/route-name';
      // if (settings.name!.contains(routeName)) {
      //   return _routeHandle(settings);
      // }
    }

    debugPrint('No Route');

    /// No Route
    // assert(false, 'Need to implement ${settings.name}');
    /// Return No Route Screen
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return const UnknownScreen();
      },
    );
  }

  /// Create the route handle functions here
  
  /// On Unknown Route
  // static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
  //   if (settings.name != null) {
  //     return MaterialPageRoute(
  //       settings: settings,
  //       builder: (context) {
  //         return const UnknownScreen();
  //       },
  //     );
  //   }
  //   return null;
  // }

  static Map<String, Widget Function(BuildContext)> get routes => _allRoutes();

  static Map<String, Widget Function(BuildContext)> _allRoutes() {
    return {
      // SplashScreen.routeName: (context) => const SplashScreen(),
    };
  }
}
