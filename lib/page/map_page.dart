import 'package:flutter/material.dart';


class MapPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("集成百度地图"),),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: new AndroidView(viewType: 'MyMap'))
        ],
      ),
    );
  }
}
