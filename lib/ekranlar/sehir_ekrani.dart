import 'package:flutter/material.dart';
import 'package:havadurumu/araclar/sabitler.dart';
import 'package:havadurumu/araclar/sabitler.dart';

class SehirEkrani extends StatefulWidget {
  @override
  _SehirEkraniState createState() => _SehirEkraniState();
}

class _SehirEkraniState extends State<SehirEkrani> {
  String sehirAdi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/sehirarkaplan.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldGirisDekorasyon,
                  onChanged: (deger) {
                    sehirAdi = deger;
                  },
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, sehirAdi);
                },
                child: Text(
                  'Hava Durumu',
                  style: kButonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
