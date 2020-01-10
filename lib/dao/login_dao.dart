import 'package:flutter_des/flutter_des.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shahe_flutter_app/model/weather_model.dart';
import 'package:shahe_flutter_app/util/md5_util.dart';
class LoginDao {

  static const URL = 'https://cloud.zq12369.com/nodeapi/deviceapi';
  static Future<WeatherModel> fetch(String _encryptBase64) async {







    final response = await http.post(URL,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode(_encryptBase64));
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      print(result.toString());
     // return WeatherModel.fromJson(result);
    } else {
      throw Exception('Failed to load home_page');
    }
  }



}
