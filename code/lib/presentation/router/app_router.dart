import 'package:cubit_counter_app/presentation/screens/home_screen.dart';
import 'package:cubit_counter_app/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    var homePageRoute = MaterialPageRoute(
      builder: (_) => HomeScreen(
        title: "Home Screen",
      ),
    );

    switch (settings.name) {
      case '/':
        return homePageRoute;
      case SecondScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(),
        );

      default:
        return homePageRoute;
    }
  }
}
