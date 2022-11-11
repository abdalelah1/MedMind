import 'package:flutter/material.dart';

import 'Screens/Welcome/welcome_screen.dart';
import 'constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedMind',
      theme: ThemeData(
         ),
      home: const WelcomeScreen(),
    );
  }
}
