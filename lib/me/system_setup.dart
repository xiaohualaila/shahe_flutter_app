import 'package:flutter/material.dart';

class SetupPage extends StatefulWidget {
  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '系统设置',
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    '本版更新',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Text(
                  '版本号v1.0',
                  style: TextStyle(color: Colors.grey),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'update_app');
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.green,
                  ),
                )
              ],
            ),
            Divider(
              color: Color(0xFFE0E0E0),
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    '关于软件',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'about_soft');
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.green,
                  ),
                )
              ],
            ),
            Divider(
              color: Color(0xFFE0E0E0),
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
