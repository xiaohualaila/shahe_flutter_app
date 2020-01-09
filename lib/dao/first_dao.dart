
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shahe_flutter_app/model/request_model.dart';
import 'package:shahe_flutter_app/model/weather_model.dart';
const WEATHER_URL = 'http://121.41.52.56:3002/environmentalapi';
class FirstDao{

  static Future<WeatherModel> fetch() async{

    var cityModel =CityModel(city: '杭州市');
    var json_str =RequestModel(method:"ENVIRONMENTAPI_GETCITYWEARTHER",params:cityModel);

    final response = await http.post(WEATHER_URL,
        headers: { 'Content-type': 'application/json', 'Accept': 'application/json'},
        body:json.encode(json_str));
    if(response.statusCode ==200){
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result =json.decode(utf8decoder.convert(response.bodyBytes));
//       print(result.toString());
      return WeatherModel.fromJson(result);
    }else{
      throw Exception('Failed to load home_page');
    }
  }
}


