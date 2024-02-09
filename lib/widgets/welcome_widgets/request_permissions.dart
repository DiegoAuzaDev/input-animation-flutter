import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RequestPermissions extends StatelessWidget {
  const RequestPermissions(
      {super.key,
      required this.changeHomeWidgte,
      required this.themeBrightness});

  final void Function() changeHomeWidgte;
  final Brightness themeBrightness;

  @override
  Widget build(BuildContext context) {
    Color colorBegin = themeBrightness == Brightness.light
        ? const Color.fromRGBO(0, 174, 239, 1)
        : const Color.fromARGB(255, 0, 116, 158);
    Color colorEnd = themeBrightness == Brightness.light
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
                "assets/welcomeAnimation.json",
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
                onPressed: changeHomeWidgte,
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
