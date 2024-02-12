import 'package:flutter/material.dart';
import 'package:input_flutter_animation/theme/colors.dart';

class MapButtons extends StatefulWidget {
  const MapButtons({super.key});

  @override
  State<MapButtons> createState() => _MapButtonsState();
}

class _MapButtonsState extends State<MapButtons> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(75),
                    border: Border.all(
                      width: 3,
                      color: const AppColors().white,
                    ),
                  ),
                  child: const CircleAvatar(
                    minRadius: 15,
                    maxRadius: 25,
                    backgroundImage: NetworkImage(
                        "https://s3.amazonaws.com/www-inside-design/uploads/2019/03/featureuserpersona.jpg"),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                IconButton.filled(
                  style: IconButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.background),
                  onPressed: () {},
                  icon: Icon(Icons.settings,
                      color: Theme.of(context).colorScheme.onBackground),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
