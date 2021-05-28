import 'package:geolocator/geolocator.dart';

class Konum {
  double enlem;
  double boylam;

  Future<void> mecvutKonumuAl() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      enlem = position.latitude;
      boylam = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
