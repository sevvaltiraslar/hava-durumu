import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'konum_ekrani.dart';
import 'package:havadurumu/servisler/hava.dart';

class YuklenmeEkrani extends StatefulWidget {
  @override
  _YuklenmeEkraniState createState() => _YuklenmeEkraniState();
}

class _YuklenmeEkraniState extends State<YuklenmeEkrani> {
  @override
  void initState() {
    super.initState();
    konumVerileriniAl();
  }

  void konumVerileriniAl() async {
    var havaDurumuVerileri = await HavaModel().konumdakiHavaDurumunuAl();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => KonumEkrani(
                  konumHavaDurumu: havaDurumuVerileri,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
