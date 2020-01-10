import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shahe_flutter_app/model/weather_model.dart';

const WEATHER_URL = 'http://121.41.52.56:3002/environmentalapi';

class FirstDao {
  static Future<WeatherModel> fetch() async {
    var map = {"city": "杭州市"};
    var map1 = {
      "method": "ENVIRONMENTAPI_GETCITYWEARTHER",
      "params": map,
    };

    print(json.encode(map1));
    final response = await http.post(WEATHER_URL,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode(map1).toString());
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
       print(result.toString());
      return WeatherModel.fromJson(result);
    } else {
      throw Exception('Failed to load home_page');
    }
  }
}
