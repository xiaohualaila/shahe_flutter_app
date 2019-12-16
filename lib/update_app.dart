import 'package:flutter/material.dart';

class UpdateAppPage extends StatefulWidget {
  @override
  _UpdateAppPageState createState() => _UpdateAppPageState();
}

class _UpdateAppPageState extends State<UpdateAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '版本更新',
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
        margin: EdgeInsets.only(top: 20,left: 20,right: 20),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    '当前版本',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Text(
                  '版本号v1.0',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.green,
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
                    '历史版本',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.green,
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
