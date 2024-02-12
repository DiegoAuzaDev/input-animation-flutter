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
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: userLatLng,
              zoom: 14.4746,
            ),
            markers: {
              Marker(
                markerId: const MarkerId("USER_ID_UNIQUE"),
                position: LatLng(userLatLng.latitude, userLatLng.longitude),
              )
            },
          ),
          const MapButtons(),
        ],
      ),
    );
  }
}
