// LocationService.dart
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<void> handleLocationButtonClick() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition();
      print(
          'Emergency button pressed. Location: ${position.latitude}, ${position.longitude}');
    } else {
      throw Exception(
          'Konum izni verilmedi. Lütfen konum izni vererek tekrar deneyin.');
    }
  }
}
