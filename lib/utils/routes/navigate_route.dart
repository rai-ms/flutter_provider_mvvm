import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/utils/routes/route_name.dart';
import 'package:flutter_provider_mvvm/view/homepage.dart';
import 'package:flutter_provider_mvvm/view/loginpage.dart';

import '../../view/signup_page.dart';
import '../../view/splash_screen_page.dart';

class NavigateRoute {
  static Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homePage:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RouteName.loginPage:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case RouteName.signupPage:
        return MaterialPageRoute(builder: (context) => const SignupPage());
      case RouteName.splashScreenPage:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
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
