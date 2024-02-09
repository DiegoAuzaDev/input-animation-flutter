import 'package:flutter/material.dart';

class InputUser extends StatefulWidget {
  const InputUser({super.key});

  @override
  State<InputUser> createState() => _InputUserState();
}

class _InputUserState extends State<InputUser> {
  int employerID = 0;

  int employeeID = 0;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                "assets/img/smart_round.webp",
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                "Es hora de empezar la ruta",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                textAlign: TextAlign.center,
                "Para poder empezar debes ingresar tu identificar personal junto con el de la empresa a la cual le prestas el servicio",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                height: 35,
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      autocorrect: false,
                      maxLength: 20,
                      decoration: InputDecoration(
                        labelText: "Identificador empresa",
                        icon: Icon(Icons.work_rounded,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      autocorrect: false,
                      maxLength: 20,
                      decoration: InputDecoration(
                        labelText: "Mi identificador",
                        icon: Icon(Icons.person,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary),
                      onPressed: () {},
                      child: const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Autenticar",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )
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
