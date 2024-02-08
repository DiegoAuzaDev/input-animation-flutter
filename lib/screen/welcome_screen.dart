import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Color colorBegin = const Color.fromRGBO(0, 174, 239, 1);
  Color colorEnd = const Color.fromRGBO(0, 68, 129, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        minimum: const EdgeInsets.symmetric(horizontal: 10),
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
                onPressed: () {
                  print("------------------------");
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Dar permisos"),
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

//  TextButton(
//                 onPressed: () {
//                   print("---------------");
//                 },
//                 child: const Row(
//                   children: [
//                     Text("Dar permisos"),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Icon(Icons.arrow_forward),
//                   ],
//                 ),
//               )

//   return Scaffold(
//     body: Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           color: Colors.blue,
//         ),
//         SafeArea(
//           bottom: false,
//           child: Container(
//             height: 100,
//             width: double.infinity,
//             color: Colors.yellow,
//           ),
//         ),
//         Positioned(
//           bottom: 0,
//           child: Container(
//             height: 100,
//             width: double.infinity,
//             color: Colors.red,
//           ),
//         )
//       ],
//     ),
//   );
// }

// LottieBuilder.asset(
//           "assets/welcomeAnimation.json",
//           width: 200,
//           height: 200,
//         ),
