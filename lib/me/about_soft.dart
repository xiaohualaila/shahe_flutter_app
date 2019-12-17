import 'package:flutter/material.dart';

class AboutSoftPage extends StatefulWidget {
  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<AboutSoftPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '关于软件',
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
          margin: EdgeInsets.only(left: 20,right: 20),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 40,bottom: 20),
                    child:Image.asset(
                      'images/map_shijing.png',
                      fit: BoxFit.fill,
                    ),
                  ),

                  Text('沙河工业云平台'),
                  Container(
                    margin: EdgeInsets.only(top:10,bottom: 40),
                    child: Text('v0.1',style: TextStyle(fontSize: 14,color: Colors.grey),) ,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '官方微信',
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '官方微博',
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
              )
          )
          ,
        );
  }
}
