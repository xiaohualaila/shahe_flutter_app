import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'loading_dialog.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                      style: TextStyle(color: Colors.green, fontSize: 18),
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
      child: Image.asset(
        'assets/images/2.0x/login_bg.png',
        fit: BoxFit.fill,
      ),
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
            // _login(username, password);
//            print(username);
//            print(password);
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
}
