import 'package:flutter/material.dart';
import 'package:input_flutter_animation/config/location_request.dart';
import 'package:input_flutter_animation/model/smart_enum.dart';
import 'package:input_flutter_animation/widgets/scaffold_messenger/scaffold_messenger.dart';
import 'package:location/location.dart';

class InputUser extends StatefulWidget {
  const InputUser({super.key});

  @override
  State<InputUser> createState() => _InputUserState();
}

class _InputUserState extends State<InputUser> {
  UserLocationRequest currentLocation = UserLocationRequest();

  late LocationData _locationData;

  final String _invalidLengthMessage =
      "Por favor ingrese un valor que tenga como minimo 6 digitos";
  final String _invalidValueTypeMessage =
      "Por favor solo ingrese valores numericos";

  String employerID = "";

  String employeeID = "";

  bool isLoadind = false;

  final _formKey = GlobalKey<FormState>();

  String? validateUserInput(String? value) {
    if (value == null || value.trim().isEmpty || value.trim().length < 4) {
      return _invalidLengthMessage;
    }
    if (value.contains(",") ||
        value.contains("-") ||
        value.contains(" ") ||
        value.contains(".")) {
      return _invalidValueTypeMessage;
    }
    return null;
  }

  void authUserInput() {
    FocusScope.of(context).unfocus();
    final isValidFormInput = _formKey.currentState!.validate();
    if (!isValidFormInput) {
      showActionSnackBar(context, SnackBarType.error, "Valores invalidos",
          "ingrese de forma correcta los valores para continuar", 3);
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      isLoadind = true;
    });
  }

  void getLocation() async {
    _locationData = await currentLocation.location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    Widget loadingIndicator = Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(
              height: 35,
            ),
            Text(
              "Estamos validando tus datos",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ),
    );

    return Center(
      child: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: isLoadind
              ? loadingIndicator
              : Column(
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
                          // ------- GET EMPLOYER ID -----
                          TextFormField(
                            validator: (value) {
                              return validateUserInput(value);
                            },
                            onSaved: (value) {
                              employerID = value!;
                            },
                            keyboardType: TextInputType.number,
                            autocorrect: false,
                            maxLength: 20,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface),
                            decoration: InputDecoration(
                              errorMaxLines: 2,
                              labelText: "Identificador empresa",
                              icon: Icon(
                                Icons.work_rounded,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          // ------- GET EMPLOYER ID -----
                          //
                          const SizedBox(
                            height: 25,
                          ),
                          //
                          // ------- GET EMPLOYEE ID -----
                          TextFormField(
                            keyboardType: TextInputType.number,
                            autocorrect: false,
                            maxLength: 20,
                            validator: (value) {
                              return validateUserInput(value);
                            },
                            onSaved: (value) {
                              employerID = value!;
                            },
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface),
                            decoration: InputDecoration(
                              errorMaxLines: 2,
                              labelText: "Mi identificador",
                              icon: Icon(Icons.person,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                          ),
                          // ------- GET EMPLOYEE ID -----
                          const SizedBox(
                            height: 30,
                          ),
                          // ------- AUTH USER INPUT  -----
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary),
                            onPressed: () {
                              authUserInput();
                            },
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
                          ),
                          // ------- AUTH USER INPUT  -----
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
