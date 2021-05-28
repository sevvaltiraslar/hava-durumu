import 'package:http/http.dart' as http;
import 'dart:convert';

class AgYardimcisi {
  AgYardimcisi(this.url);

  final String url;

  Future veriAl() async {
    http.Response istek = await http.get(url);
    if (istek.statusCode == 200) {
      String veri = istek.body;
      return jsonDecode(veri);
    } else {
      print(istek.statusCode);
    }
  }
}
