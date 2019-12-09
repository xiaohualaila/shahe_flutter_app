import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('沙河app'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              Image.asset(
                'assets/images/3.0x/rx.png',
                fit: BoxFit.cover,
              ),

              Container(
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 120, bottom: 120),
                padding:
                    EdgeInsets.only(left: 30, top: 50, right: 30, bottom: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.local_gas_station,
                          color: Colors.green,
                        ),
                        Text(
                          '账号:',
                          style: TextStyle(color: Colors.green, fontSize: 18),
                        )
                      ],
                    ),
//                Row(children: <Widget>[
//                  TextField(),
//                  Icon(Icons.delete,color: Colors.green,)
//                ],),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.local_gas_station,
                          color: Colors.green,
                        ),
                        Text(
                          '密码:',
                          style: TextStyle(color: Colors.green, fontSize: 18),
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: _bottomButton())
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:100,left: 60,right: 60),
                padding:
                EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.green, Colors.greenAccent]),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '欢迎登录沙河工业云',
                        textAlign:TextAlign.center,
                        style: TextStyle(color: Colors.white,fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      )),
    );
  }

  _bottomButton() {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: RaisedButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.only(top: 13, bottom: 15),
          color: Colors.blue,
          child: Text(
            '免费领取',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
