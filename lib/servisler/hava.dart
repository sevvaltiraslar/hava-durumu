import 'package:havadurumu/servisler/ag_olusturma.dart';
import 'package:havadurumu/servisler/konum.dart';

const apiKey = 'c5bff5894b76a204ce098dbad6834558';
const havaDurumuURLac = 'http://api.openweathermap.org/data/2.5/weather';

class HavaModel {
  Future<dynamic> sehirHavaDurumuAl(String sehirAdi) async {
    AgYardimcisi agYardimcisi =
        AgYardimcisi('$havaDurumuURLac?q=$sehirAdi&appid=$apiKey&units=metric');
    var havaDurumuVerileri = await agYardimcisi.veriAl();
    return havaDurumuVerileri;
  }

  Future<dynamic> konumdakiHavaDurumunuAl() async {
    Konum konum = Konum();
    await konum.mecvutKonumuAl();
    AgYardimcisi agYardimcisi = AgYardimcisi(
        '$havaDurumuURLac?lat=${konum.enlem}&lon=${konum.boylam}&appid=$apiKey&units=metric');

    var havaDurumuVerileri = await agYardimcisi.veriAl();

    return havaDurumuVerileri;
  }

  String havaDurumuIconuAl(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String mesajiAl(int sicak) {
    if (sicak > 25) {
      return 'Öğlen güneşine dikkat edin.';
    } else if (sicak > 20) {
      return 'Güneş kreminizi süremeyi unutmayın.';
    } else if (sicak < 10) {
      return 'Atkıya ve eldivene ihtiyacınız olabilir.';
    } else {
      return 'Havalar soğumaya başladı.';
    }
  }
}
