import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/utils/routes/route_name.dart';
import 'package:flutter_provider_mvvm/view/homepage.dart';
import 'package:flutter_provider_mvvm/view/loginpage.dart';

class NavigateRoute {
  static Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homePage:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RouteName.loginPage:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      default:
        return MaterialPageRoute(
            builder: ((context) => const Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Error 404")
                    ],
                ))));
    }
  }
}
