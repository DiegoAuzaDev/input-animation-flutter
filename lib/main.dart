import 'package:flutter/material.dart';
import 'package:input_flutter_animation/screen/welcome_screen.dart';
import 'package:input_flutter_animation/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.define(context),
      home: WelcomeScreen(
        deviceTheme: AppTheme.define(context).brightness,
      ),
    );
  }
}
