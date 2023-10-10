import '../helpers/app_localization.dart';
import '../main.dart';

extension Translate on String {
  String get translate {
    return _translate();
  }

  String _translate() {
    if (navigatorKey.currentContext == null) {
      return this;
    } else {
      return AppLocalization.of(navigatorKey.currentContext!)!.translate(this);
    }
  }
}

/// In main file
/// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
/// Put in materialapp 
