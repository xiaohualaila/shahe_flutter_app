import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shahe_flutter_app/model/common_model.dart';

class HttpAsyncDemo extends StatefulWidget {
  @override
  _HttpAsyncDemoState createState() => _HttpAsyncDemoState();
}

class _HttpAsyncDemoState extends State<HttpAsyncDemo> {
  String showResult = '';

  Future<CommonModel> fetchPost() async {
    final response = await http
        .get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    Utf8Decoder utf8codec = new Utf8Decoder();
    final result = json.decode( utf8codec.convert(response.bodyBytes));
    return CommonModel.fromJson(result);
  }


  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('http网络测试'),
        ),
        // ignore: missing_return
        body: FutureBuilder<CommonModel>(future : fetchPost(),builder: (BuildContext context,AsyncSnapshot<CommonModel> snapshot){
                 switch(snapshot.connectionState){
                   case ConnectionState.none:
                     return new Text('input url to start');
                   case ConnectionState.waiting:
                     return new Center(child: new CircularProgressIndicator(),);
                   case ConnectionState.active:
                     return new Text('');
                   case ConnectionState.done:
                     if(snapshot.hasError){
                        return new Text('${snapshot.error}',style: TextStyle(color: Colors.red),);
                     }else{
                         return Column(
                           children: <Widget>[
                             Text('icon:${snapshot.data.icon}'),
                             // ignore: missing_return
                             Text('statusBarColor:${snapshot.data.statusBarColor}'),
                             Text('url:${snapshot.data.url}'),
                             Text('title:${snapshot.data.title}')
                           ],
                         );
                     }
                 }
        }),

      ),
    );
  }
}
