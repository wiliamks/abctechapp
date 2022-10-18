import 'package:abctechapp/service/geolocation_service.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationServiceImpl implements GeolocationService {
  bool _serviceEnabled = false;
  late LocationPermission _permission = LocationPermission.denied;

  @override
  Future<bool> enableService() async {
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!_serviceEnabled) {
      return Future.error('Geolocation service are disabled');
    }

      return Future.sync(() => true);
  }

  @override
  Future<void> requestPermission() async {
    _permission = await Geolocator.checkPermission();

    if (_permission == LocationPermission.denied) {
      _permission = await Geolocator.requestPermission();
    }

    return Future.sync(() => null);
  }

  @override
  Future<Position> getPosition() async {
    return await Geolocator.getCurrentPosition();
  }

  @override
  bool isPermissionEnabled() {
    if (_permission == LocationPermission.denied ||
        _permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  @override
  Future<bool> start() async {
    bool enabled = await enableService();
    if (enabled) {
      await requestPermission();
      return Future.sync(() => true);
    }
    return Future.sync(() => false);
  }

}
