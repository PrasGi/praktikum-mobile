import 'package:expanse_tracker/pages/history-detail.dart';
import 'package:expanse_tracker/pages/history.dart';
import 'package:expanse_tracker/pages/home.dart';
import 'package:expanse_tracker/pages/login.dart';
import 'package:expanse_tracker/pages/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/home': (context) => Home(),
        '/history': (context) => History(),
        '/history/detail': (context) => HistoryDetail(),
      },
    );
  }
}
