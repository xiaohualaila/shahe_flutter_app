import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shahe_flutter_app/model/common_model.dart';

class HttpDemo extends StatefulWidget {
  @override
  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  String showResult = '';

  Future<CommonModel> fetchPost() async {
    final response = await http
        .get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    final result = json.decode(response.body);
    return CommonModel.fromJson(result);
  }


  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('http网络测试'),
        ),
        body: Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  fetchPost().then((CommonModel value) {
                    setState(() {
                      showResult =
                          '请求结果：\n hideAppBar:${value.hideAppBar}\n icon:${value.icon}';
                      print(showResult);
                    });
                  });
                },
                child: Text(
                  '点我',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Text(showResult)
            ],
          ),

      ),
    );
  }
}
