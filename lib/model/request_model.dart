class RequestModel{
  final String method;
  final CityModel params;
  RequestModel({this.method,this.params});


  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return json != null
        ? RequestModel(
         method: json['method'],
         params:json['params'] != null ? new CityModel.fromJson(json['sk_info']):null
      ) : null;
  }

//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['method'] = this.method;
//    data['params'] = this.params;
//    return data;
//  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.params != null) {
      data['method'] = this.method;
      data['params'] = this.params.toJson();
    }
    return data;
  }
}

class CityModel {
  final String city;

  CityModel({this.city});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return json != null
        ? CityModel(city: json['city'],)
        : null;
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    return data;
  }
}