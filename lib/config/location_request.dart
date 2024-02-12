import 'package:location/location.dart';

class UserLocationRequest {
  Location location = Location();
  late bool serviceEnable;
  late PermissionStatus permissionStatus;

  Future<bool> requesUserLocation() async {
    bool isGranted = true;
    serviceEnable = await location.serviceEnabled();
    if (!serviceEnable) {
      serviceEnable = await location.requestService();
      if (!serviceEnable) {
        isGranted = false;
      }
    }
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        isGranted = false;
      }
    }
    return isGranted;
  }
}
