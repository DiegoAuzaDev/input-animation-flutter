import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:input_flutter_animation/screen/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Brightness themeBrightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: themeBrightness,
        colorScheme: ColorScheme.fromSeed(
          brightness: themeBrightness,
          seedColor: const Color.fromARGB(255, 38, 101, 137),
          secondary: const Color.fromARGB(255, 80, 96, 110),
          tertiary: const Color.fromARGB(255, 100, 89, 123),
        ),
        textTheme: GoogleFonts.soraTextTheme(),
      ),
      home: const WelcomeScreen(),
    );
  }
}
