import 'package:flutter/material.dart';
import 'package:input_flutter_animation/model/smart_enum.dart';

Color setContainerColor(SnackBarType type, BuildContext context) {
  Color containerColor = Theme.of(context).colorScheme.primary;
  switch (type) {
    case SnackBarType.success:
      containerColor = Colors.green;
      break;
    case SnackBarType.error:
      containerColor = Theme.of(context).colorScheme.errorContainer;
      break;
    case SnackBarType.warning:
      containerColor = Colors.orange;
      break;
    default:
      containerColor = Colors.green;
  }
  return containerColor;
}

void showActionSnackBar(BuildContext context, SnackBarType snackBarType,
    String snackBarTitle, String? snackBarContent) {
  final snackBar = SnackBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    content: Container(
      decoration: BoxDecoration(
        color: setContainerColor(snackBarType, context),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  snackBarTitle,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                if (snackBarContent != null)
                  Text(
                    snackBarContent,
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium!.fontSize,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
              ],
            ),
            const Icon(Icons.star)
          ],
        ),
      ),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
