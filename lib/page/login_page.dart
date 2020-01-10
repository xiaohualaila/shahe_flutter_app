import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_des/flutter_des.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:shahe_flutter_app/dao/login_dao.dart';
import 'package:shahe_flutter_app/util/md5_util.dart';
import '../loading_dialog.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

//客户端的向量参数  向量/偏移量
  //static const _iv  = "cGFsbWRI";  u1BvOHzUOcklgNpn1MaWvdn9DT4LyzSX
  static const _iv  = "12345678";
//加密密钥
  // static const _key  = "cGFsbWFwaWVuTQ==";
  static const _key  = "u1BvOHzUOcklgNpn1MaWvdn9DT4LyzSX";
  //设定参数
  static const CIPHER_TYPE = "DES/CBC/PKCS7Padding"; //设定参数
 String _text = "";
  static String  _encryptBase64 ="";




  TextEditingController _userNameController = TextEditingController();
  TextEditingController _psdController = TextEditingController();

  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _psdFocusNode = FocusNode();

  /// 显示Loading
  _showLoading(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return new LoadingDialog(
            outsideDismiss: false,
            loadingText: "正在登陆...",
          );
        });
  }

  /// 隐藏Loading
  _dismissLoading(BuildContext context) {
    Navigator.of(context).pop();
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardAction(
          focusNode: _userNameFocusNode,
        ),
        KeyboardAction(
          focusNode: _psdFocusNode,
          closeWidget: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.close),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          backgound(),
          Container(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                  child: TextField(
                    focusNode: _userNameFocusNode,
                    autofocus: false,
                    controller: _userNameController,
                    decoration: InputDecoration(
//                        labelText: "用户名",
                      hintText: "请输入用户名",
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                    maxLines: 1,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.local_gas_station,
                      color: Colors.green,
                    ),
                    Text(
                      '密码:',
                      style: TextStyle(color: Colors.green, fontSize: 18,),
                    )
                  ],
                ),
                TextField(
                  focusNode: _psdFocusNode,
                  controller: _psdController,
                  decoration: InputDecoration(
                    //     labelText: "密码",
                    labelStyle: TextStyle(color: Colors.green),
                    hintText: "请输入密码",
                  ),
                  obscureText: true,
                  maxLines: 1,
                ),
                _bottomButton()
              ],
            ),
          ),
        ],
      ),
    );
  }

  backgound() {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 1,
      //child:Image(image: AssetImage('images/login_bg.png'),  fit: BoxFit.fill,),
      child: Image.asset('images/login_bg.png',  fit: BoxFit.fill,),
    );
  }

  _bottomButton() {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 40),
        child: RaisedButton(
          onPressed: () {
            String username = _userNameController.text;
            String password = _psdController.text;
             _login(username, password);
            print(username);
            print(password);
//            Navigator.of(context)
//                .push(MaterialPageRoute(builder: (BuildContext context) {
//              return TabNavigator();
//            }));
             Navigator.pushNamed(context, 'tab_navigator');
          
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.only(top: 10, bottom: 10),
          color: Colors.green,
          child: Text(
            '登录',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _login(String username, String password) {


    String appId = "09a81bbeead6416312a6d2df0418a449";
    String method = "DEVICEAPI_GETUSERLIST";
    String clienttype = "Android";
    String timestamp = new DateTime.now().millisecondsSinceEpoch.toString();

    var map = {
      "username": "shadmin",
      "password": "123456",};

    String md5 = Md5Util.generateMd5(appId + method + timestamp + clienttype + json.encode(map));
    var map1 = {
      "appId": appId,
      "java": true,
      "method":method,
      "timestamp":timestamp,
      "clienttype": clienttype,
      "object": map,
      "secret": md5,
    };

    _text = json.encode(map1);

    print(_text);
   // crypt();
    //_handleRefresh();

  }

  Future<Null> _handleRefresh() async {
    try {
     await LoginDao.fetch(_encryptBase64);
      setState(() {

      //  _loading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
      //  _loading = false;
      });
    }
    return null;
  }

  Future<void> crypt() async {

    try {
      _encryptBase64 = await FlutterDes.encryptToBase64(_text, _key, iv: _iv);
    } catch (e) {
      print(e);
    }
  }



  static String getKey(){
    String md5_key =  Md5Util.generateMd5(_key);
    md5_key = md5_key.substring(0, 16);
    return md5_key;
  }

  static String getIv(){
    String md5_iv =  Md5Util.generateMd5(_iv );
    md5_iv = md5_iv.substring(md5_iv.length - 8);
    return md5_iv;
  }
}
