import 'package:geolocator/geolocator.dart';

abstract class GeolocationService {
  Future<bool> enableService();
  Future<void> requestPermission();
  bool isPermissionEnabled();
  Future<Position> getPosition();
  Future<bool> start();
}
