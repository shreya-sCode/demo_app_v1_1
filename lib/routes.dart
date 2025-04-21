import 'package:demo_app_v1_1/screens/home.dart';
import 'package:demo_app_v1_1/screens/login.dart';
import 'package:demo_app_v1_1/screens/signup.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignUpScreen(),
  };
}
