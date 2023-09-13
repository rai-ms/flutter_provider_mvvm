import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/view/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();


  @override
  void initState() {
    // TODO: implement initState
    splashServices.checkAuthentication(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("SplashScreen", style:  Theme.of(context).textTheme.headlineMedium,),
      ),
    );
  }
}
