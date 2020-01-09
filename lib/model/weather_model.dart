
class WeatherModel {
  bool success;
  Result result;

  WeatherModel({this.success, this.result});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  Yesterday yesterday;
  String city;
  String aqi;
  List<Forecast> forecast;
  String ganmao;
  String wendu;

  Result(
      {this.yesterday,
        this.city,
        this.aqi,
        this.forecast,
        this.ganmao,
        this.wendu});

  Result.fromJson(Map<String, dynamic> json) {
    yesterday = json['yesterday'] != null
        ? new Yesterday.fromJson(json['yesterday'])
        : null;
    city = json['city'];
    aqi = json['aqi'];
    if (json['forecast'] != null) {
      forecast = new List<Forecast>();
      json['forecast'].forEach((v) {
        forecast.add(new Forecast.fromJson(v));
      });
    }
    ganmao = json['ganmao'];
    wendu = json['wendu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.yesterday != null) {
      data['yesterday'] = this.yesterday.toJson();
    }
    data['city'] = this.city;
    data['aqi'] = this.aqi;
    if (this.forecast != null) {
      data['forecast'] = this.forecast.map((v) => v.toJson()).toList();
    }
    data['ganmao'] = this.ganmao;
    data['wendu'] = this.wendu;
    return data;
  }
}

class Yesterday {
  String date;
  String high;
  String fx;
  String low;
  String fl;
  String type;

  Yesterday({this.date, this.high, this.fx, this.low, this.fl, this.type});

  Yesterday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    high = json['high'];
    fx = json['fx'];
    low = json['low'];
    fl = json['fl'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['high'] = this.high;
    data['fx'] = this.fx;
    data['low'] = this.low;
    data['fl'] = this.fl;
    data['type'] = this.type;
    return data;
  }
}

class Forecast {
  String date;
  String high;
  String fengli;
  String low;
  String fengxiang;
  String type;

  Forecast( {this.date, this.high, this.fengli, this.low, this.fengxiang, this.type});

  Forecast.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    high = json['high'];
    fengli = json['fengli'];
    low = json['low'];
    fengxiang = json['fengxiang'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['high'] = this.high;
    data['fengli'] = this.fengli;
    data['low'] = this.low;
    data['fengxiang'] = this.fengxiang;
    data['type'] = this.type;
    return data;
  }
}