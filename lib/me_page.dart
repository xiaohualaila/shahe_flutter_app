import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  double paddingTop;

  @override
  Widget build(BuildContext context) {
    paddingTop = MediaQuery.of(context).padding.top;
    return Column(
      children: <Widget>[topContent(), middleContent(), _bottomButton()],
    );
  }

  topContent() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green, Colors.greenAccent],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight)),
      child: topAccount(),
    );
  }

  topAccount() {
    return Container(
      margin: EdgeInsets.only(
        top: paddingTop,
      ),
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30),
            child: Icon(Icons.add),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '小张',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white),
                ),
                Text('账号：1245',
                    style: TextStyle(color: ColorUtil.color('FFFFFF')))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.only(top: 2, bottom: 2, left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: Text('个人用户', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  middleContent() {
    return Container(
        margin: EdgeInsets.only(left: 10, top: 20, right: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Color(0xFFE0E0E0), width: 1),
            color: Colors.white),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.brightness_auto,
                  color: Colors.green,
                ),
                Expanded(child: Text('文字大小')),
                Text('适中'),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.green,
                ),
              ],
            ),
            Divider(
              color: Color(0xFFE0E0E0),
              height: 20,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.settings,
                  color: Colors.green,
                ),
                Expanded(child: Text('系统设置')),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ));
  }

  _bottomButton() {
    return FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          margin: EdgeInsets.only(top: 300),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.only(top: 13, bottom: 15),
              color: Colors.green,
              child: Text(
                '退出登录',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ));
  }
}
