import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:input_flutter_animation/widgets/map_widgets/buttons_widgets.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.userLocation});

  final LocationData userLocation;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng userLatLng = const LatLng(37.43296265331129, -122.08832357078792);

  void setCameraPosition() {
    setState(() {
      userLatLng =
          LatLng(widget.userLocation.latitude!, widget.userLocation.longitude!);
    });
  }

  double notificationDraggable = 0.25;

  @override
  void initState() {
    super.initState();
    setCameraPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: MediaQuery.of(context).size.height * 0.25,
            child: GoogleMap(
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              rotateGesturesEnabled: true,
              compassEnabled: true,
              mapType: MapType.satellite,
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: userLatLng,
                zoom: 14.4746,
              ),
            ),
          ),
          const Positioned(
            top: 1,
            right: 1,
            child: MapButtons(),
          ),
          Positioned.fill(
            bottom: 0,
            child: NotificationListener<DraggableScrollableNotification>(
              onNotification: (notification) {
                setState(() {
                  notificationDraggable = notificationDraggable =
                      1 - ((notification.extent - 0.25) / (1 - 0.25));
                });
                print(notificationDraggable);
                return true;
              },
              child: DraggableScrollableSheet(
                expand: true,
                initialChildSize: 0.25,
                minChildSize: 0.25,
                maxChildSize: 1,
                builder: (context, scrollController) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Material(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Theme.of(context).colorScheme.background,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 15,
                                right: 15,
                                top: 20 + (30 * (1 - notificationDraggable)),
                                bottom: 15,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            "Ruta Florest Sur - Diego Auza T",
                                            maxLines: 2,
                                            overflow: TextOverflow.fade,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onBackground),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\u2022 Tiempo 6 Horas",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "\u2022 Paradas 20",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "\u2022 Distancia 15KM",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                controller: scrollController,
                                itemCount: 20,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: const Icon(
                                      Icons.location_on_rounded,
                                    ),
                                    title: Text("Tienda donde pedro #$index"),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -40 + (150 * (1 - notificationDraggable)),
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  foregroundColor: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer),
                              onPressed: () {},
                              child: SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Tap para empezar tu ruta"),
                                    Icon(
                                        Icons.subdirectory_arrow_right_outlined)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}




  // Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         ElevatedButton(
  //                           style: ElevatedButton.styleFrom(
  //                               backgroundColor: Theme.of(context)
  //                                   .colorScheme
  //                                   .primaryContainer,
  //                               foregroundColor: Theme.of(context)
  //                                   .colorScheme
  //                                   .onPrimaryContainer),
  //                           onPressed: () {},
  //                           child: const Expanded(
  //                             child: Row(
  //                               mainAxisSize: MainAxisSize.max,
  //                               children: [
  //                                 Text("Empezar Ruta"),
  //                                 Icon(Icons.subdirectory_arrow_right_sharp)
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),


    // ElevatedButton(
    //                         style: ElevatedButton.styleFrom(
    //                             backgroundColor: Theme.of(context)
    //                                 .colorScheme
    //                                 .primaryContainer,
    //                             foregroundColor: Theme.of(context)
    //                                 .colorScheme
    //                                 .onPrimaryContainer),
    //                         onPressed: () {},
    //                         child: const Text("adsfasdfasdfas"),
    //                       ),


        // markers: {
              //   Marker(
              //     markerId: const MarkerId("USER_ID_UNIQUE"),
              //     position: LatLng(userLatLng.latitude, userLatLng.longitude),
              //   )
              // },