import 'package:flutter/material.dart';
import 'package:havadurumu/araclar/sabitler.dart';
import 'package:havadurumu/servisler/hava.dart';
import 'sehir_ekrani.dart';

class KonumEkrani extends StatefulWidget {
  KonumEkrani({this.konumHavaDurumu});
  final konumHavaDurumu;

  @override
  _KonumEkraniState createState() => _KonumEkraniState();
}

class _KonumEkraniState extends State<KonumEkrani> {
  HavaModel hava = HavaModel();
  int sicaklik;
  String havaDurumuIcon;
  String sehirAdi;
  String havaDurumuMesaji;
  @override
  void initState() {
    super.initState();
    guncelleUI(widget.konumHavaDurumu);
  }

  void guncelleUI(dynamic havaDurumuVerileri) {
    setState(() {
      if (havaDurumuVerileri == null) {
        sicaklik = 0;
        havaDurumuIcon = 'Hata';
        havaDurumuMesaji = 'Hava durmu verileri alınamıyor.';
        sehirAdi = '';
        return;
      }
      double sicak = havaDurumuVerileri['main']['temp'];
      sicaklik = sicak.toInt();
      var kosul = havaDurumuVerileri['weather'][0]['id'];
      havaDurumuIcon = hava.havaDurumuIconuAl(kosul);
      havaDurumuMesaji = hava.mesajiAl(sicaklik);
      sehirAdi = havaDurumuVerileri['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/sehirarkaplan.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: () async {
                      var havaDurumuVerileri =
                          await hava.konumdakiHavaDurumunuAl();
                      guncelleUI(havaDurumuVerileri);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var yazilanSehir = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SehirEkrani()));
                      if (yazilanSehir != null) {
                        var havaDurumuVerileri =
                            await hava.sehirHavaDurumuAl(yazilanSehir);
                        guncelleUI(havaDurumuVerileri);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      '$sicaklik°',
                      style: kSicaklikTextStyle,
                    ),
                    Text(
                      havaDurumuIcon,
                      style: kDurumTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$havaDurumuMesaji $sehirAdi',
                  textAlign: TextAlign.right,
                  style: kMesajTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
