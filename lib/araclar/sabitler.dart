import 'package:flutter/material.dart';

const kSicaklikTextStyle = TextStyle(
  fontSize: 80.0,
);
const kMesajTextStyle = TextStyle(
  fontSize: 30.0,
);
const kDurumTextStyle = TextStyle(
  fontSize: 80.0,
);
const kButonTextStyle = TextStyle(
  fontSize: 30.0,
);
const kTextFieldGirisDekorasyon = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Şehir İsmini Giriniz',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
