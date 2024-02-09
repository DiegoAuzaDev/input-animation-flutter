import 'package:flutter/material.dart';
import 'package:input_flutter_animation/widgets/welcome_widgets/input_data.dart';
import 'package:input_flutter_animation/widgets/welcome_widgets/request_permissions.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.deviceTheme});

  final Brightness deviceTheme;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool permissionGranted = false;
  bool showQuestionIconButton = false;

  void widgetChanger() {
    setState(() {
      showQuestionIconButton = !showQuestionIconButton;
      permissionGranted = !permissionGranted;
    });
  }

  Widget widgetController() {
    if (permissionGranted) {
      return const InputUser();
    }
    return RequestPermissions(
      changeHomeWidgte: widgetChanger,
      themeBrightness: widget.deviceTheme,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: showQuestionIconButton == true
          ? IconButton.filled(
              style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary),
              highlightColor: Theme.of(context).colorScheme.primary,
              onPressed: () {},
              icon: const Icon(
                Icons.question_mark_rounded,
              ),
            )
          : null,
      body: widgetController(),
    );
  }
}
