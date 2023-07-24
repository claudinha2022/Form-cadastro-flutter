import 'package:flutter/material.dart';
import 'package:flutter1/Views/List_user.dart';
import 'package:flutter1/Views/login_screen.dart';
import 'package:flutter1/Views/signup_screen.dart';
import 'package:flutter1/Views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
         '/home': (context) => HomeScreen(),
        '/signup': (context) => SignupScreen(),
           '/listScreen': (context) => ListUserScreen(),
       
      },
    );
  }
}
