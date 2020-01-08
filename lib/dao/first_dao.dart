
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shahe_flutter_app/model/common_model.dart';
import 'package:shahe_flutter_app/model/request_model.dart';
const WEATHER_URL = 'http://121.41.52.56:3002/environmentalapi';
const HOme_Url = 'https://www.devio.org/io/flutter_app/json/home_page.json';
class FirstDao{

  static Future<CommonModel> fetch() async{
//    object.put("method", "ENVIRONMENTAPI_GETCITYWEARTHER");
//    object1.put("city", city);
//    object.put("params",object1);
    //   var str =RequestModel(method: "ENVIRONMENTAPI_GETCITYWEARTHER",params: cityModel).toJson();
    // print(str);
    var cityModel =CityModel(city: '杭州市');

    var json_str =RequestModel(method:"ENVIRONMENTAPI_GETCITYWEARTHER",params:cityModel);

    print(json_str);
    final response = await http.post(WEATHER_URL,
        headers: { 'Content-type': 'application/json', 'Accept': 'application/json'},
        body:json.encode(json_str));
   // final response = await http.get(HOme_Url);
    if(response.statusCode ==200){
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result =json.decode(utf8decoder.convert(response.bodyBytes));
       print(result.toString());
      return CommonModel.fromJson(result);
    }else{
      throw Exception('Failed to load home_page');
    }
  }
}


