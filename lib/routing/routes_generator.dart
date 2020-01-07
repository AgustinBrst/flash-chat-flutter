import 'package:flutter/material.dart';

import '../screens/chat_screen.dart';
import '../screens/login_screen.dart';
import '../screens/registration_screen.dart';
import '../screens/welcome_screen.dart';
import 'routes.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String routeName = settings.name;

    switch (routeName) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.welcome:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case Routes.registration:
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      case Routes.chat:
        return MaterialPageRoute(builder: (_) => ChatScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
