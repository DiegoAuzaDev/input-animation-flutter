import 'package:flutter/material.dart';
import 'package:input_flutter_animation/config/location_request.dart';
import 'package:input_flutter_animation/model/smart_enum.dart';
import 'package:input_flutter_animation/widgets/scaffold_messenger/scaffold_messenger.dart';
import 'package:location/location.dart';
import 'package:lottie/lottie.dart';

class RequestPermissions extends StatefulWidget {
  const RequestPermissions(
      {super.key,
      required this.changeHomeWidgte,
      required this.themeBrightness});

  final void Function() changeHomeWidgte;
  final Brightness themeBrightness;

  @override
  State<RequestPermissions> createState() => _RequestPermissionsState();
}

class _RequestPermissionsState extends State<RequestPermissions> {
  @override
  Widget build(BuildContext context) {
    Color colorBegin = widget.themeBrightness == Brightness.light
        ? const Color.fromRGBO(0, 174, 239, 1)
        : const Color.fromARGB(255, 0, 116, 158);
    Color colorEnd = widget.themeBrightness == Brightness.light
        ? const Color.fromRGBO(0, 68, 129, 1)
        : const Color.fromARGB(255, 0, 29, 55);
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorBegin,
            colorEnd,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LottieBuilder.asset(
                Theme.of(context).colorScheme.brightness == Brightness.dark
                    ? "assets/welcomeAnimationLight.json"
                    : "assets/welcomeAnimationDark.json",
                width: double.infinity,
                height: 150,
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                "Bienvenido a Smart",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                textAlign: TextAlign.center,
                "Para poder disfrutar de los servicios que ofrece Smart requiere que habilites el acceso a tu ubicacion, camara y galeria",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    backgroundColor:
                        Theme.of(context).colorScheme.onPrimaryContainer),
                onPressed: () async {
                  UserLocationRequest location = UserLocationRequest();
                  bool requestuserLoation = await location.requesUserLocation();
                  if (!context.mounted) {
                    return;
                  }
                  if (requestuserLoation) {
                    widget.changeHomeWidgte();
                  } else {
                    showActionSnackBar(
                        context,
                        SnackBarType.error,
                        "Valores invalidos",
                        "ingrese de forma correcta los valores para continuar",
                        3);
                  }
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Dar permisos",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
