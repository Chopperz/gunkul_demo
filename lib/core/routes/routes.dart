import 'package:flutter/widgets.dart';
import 'package:gunkul_demo/feature/authenticate/authenticate.dart';
import 'package:gunkul_demo/feature/home/home_screen.dart';
import 'package:gunkul_demo/feature/profile/profile_screen.dart';

class Routes {
  static Routes instance = Routes._();

  Routes._();

  factory Routes() => instance;

  Map<String, Widget Function(BuildContext)> routes = {
    ..._homeRoutes,
    ..._authRoutes,
  };

  static final Map<String, Widget Function(BuildContext)> _homeRoutes = {
    "/home": (context) {
      return const HomeScreen();
    },
  };

  static final Map<String, Widget Function(BuildContext)> _authRoutes = {
    "/login": (context) {
      return const LoginScreen();
    },
    "/profile": (context) {
      return const ProfileScreen();
    }
  };
}
