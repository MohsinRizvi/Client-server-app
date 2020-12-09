import 'package:dashboard_flutter_01/login/signup.dart';
import 'package:flutter/material.dart';
import 'Welcome/IntroScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/signUp': (BuildContext context) => SignupPage(),
      },
      home: IntroScreen(),
    );
  }
}
