import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/utils/routes/route_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteName.loginPage);
              },
              child: const Text(
                "Goto LoginPage",
              ))
        ],
      ),
    );;
  }
}
