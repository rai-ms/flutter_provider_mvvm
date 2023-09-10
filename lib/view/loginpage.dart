import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/utils/routes/navigate_route.dart';
import 'package:flutter_provider_mvvm/utils/routes/route_name.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteName.homePage);
              },
              child: const Text(
                "Goto HomePage",
              )),
        ],
      ),
    );
  }
}