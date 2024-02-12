import 'package:flutter/material.dart';
import 'package:input_flutter_animation/theme/colors.dart';
import 'package:input_flutter_animation/widgets/map_widgets/buttons_widgets.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).colorScheme.primary,
          ),
          const MapButtons(),
        ],
      ),
    );
  }
}
