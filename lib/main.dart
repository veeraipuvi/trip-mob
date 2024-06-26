import 'package:flutter/material.dart';
import './pages/login.dart';
import "./pages/home_page.dart" ;
import "./pages/signup.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginForm(),
        '/signup': (context) => SignupForm(),
      },
    );
  }
}
