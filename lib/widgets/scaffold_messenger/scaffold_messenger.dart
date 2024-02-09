import 'package:flutter/material.dart';
import 'package:input_flutter_animation/model/smart_enum.dart';
import 'package:input_flutter_animation/theme/app_theme.dart';

Color setContainerColor(SnackBarType type, BuildContext context) {
  Color containerColor = AppTheme.colors.success;
  switch (type) {
    case SnackBarType.error:
      containerColor = Theme.of(context).colorScheme.errorContainer;
      break;
    case SnackBarType.warning:
      containerColor = AppTheme.colors.warning;
      break;
    default:
      containerColor;
  }
  return containerColor;
}

Icon setContainerIcon(SnackBarType type) {
  Icon containerIcon = Icon(
    Icons.check_circle_sharp,
    color: AppTheme.colors.white,
    size: 35,
  );
  switch (type) {
    case SnackBarType.error:
      containerIcon = Icon(
        size: 35,
        Icons.error_sharp,
        color: AppTheme.colors.white,
      );
      break;
    case SnackBarType.warning:
      containerIcon = Icon(
        size: 35,
        Icons.warning_sharp,
        color: AppTheme.colors.white,
      );
      break;
    default:
      containerIcon;
  }
  return containerIcon;
}

void showActionSnackBar(BuildContext context, SnackBarType snackBarType,
    String snackBarTitle, String? snackBarContent, int duration) {
  double width = MediaQuery.of(context).size.width / 2;
  final snackBar = SnackBar(
    duration: Duration(seconds: duration),
    elevation: 0,
    backgroundColor: Colors.transparent,
    content: Container(
      decoration: BoxDecoration(
        color: setContainerColor(snackBarType, context),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  width: width,
                  child: Text(
                    snackBarTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                if (snackBarContent != null)
                  SizedBox(
                    width: width,
                    child: Text(
                      snackBarContent,
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
              ],
            ),
            setContainerIcon(snackBarType),
          ],
        ),
      ),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
