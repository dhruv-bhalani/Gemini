import 'package:flutter/cupertino.dart';
import 'package:gemini/views/Gemini/Gemini.dart';
import 'package:gemini/views/Splash/splash.dart';

class Rouets {
  Map<String, Widget Function(BuildContext)> get allRoutes {
    return {
      '/': (context) => const Splashscreen(),
      '/gemini': (context) => const Gemini(),
    };
  }
}
