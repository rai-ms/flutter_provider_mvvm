import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/utils/routes/navigate_route.dart';
import 'package:flutter_provider_mvvm/utils/routes/route_name.dart';
import 'package:flutter_provider_mvvm/view/homepage.dart';
import 'package:flutter_provider_mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=>AuthViewModel(),
        ),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteName.homePage,
      onGenerateRoute: NavigateRoute.onGenerate,
    ),);
  }
}
