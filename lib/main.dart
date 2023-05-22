import 'package:flutter/material.dart';
import 'package:flutter_code_test/pages/congrats_page.dart';
import 'package:flutter_code_test/pages/details_page.dart';
import 'package:flutter_code_test/pages/login_screen.dart';

import 'pages/plans_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GoGetIt',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: LoginScreen.routeName,
        routes: {
          LoginScreen.routeName: (context) => const LoginScreen(),
          PlansPage.routeName: (context) => const PlansPage(),
          DetailsPage.routeName: (context) => const DetailsPage(),
          CongratsPage.routeName: (context) => const CongratsPage(),
        });
  }
}
