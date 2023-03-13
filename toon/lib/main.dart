import 'package:flutter/material.dart';
import 'package:toon/screens/home.dart';

void main() {
  runApp(const App());
  // ApiService().getTodaysToons();
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
