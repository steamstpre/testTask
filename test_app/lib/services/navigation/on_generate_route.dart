import 'package:flutter/material.dart';
import 'package:test_app/screens/about_screen.dart';
import 'package:test_app/screens/main_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => MainScreen());
      case '/about_screen':
        return MaterialPageRoute(builder: (context) => AboutScreen());
      default:
        return _defaultRoute();
    }
  }

  static Route<dynamic> _defaultRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text('Error'),
          ),
        );
      },
    );
  }
}
