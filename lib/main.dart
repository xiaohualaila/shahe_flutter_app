import 'package:flutter/material.dart';
import 'package:shahe_flutter_app/me/about_soft.dart';
import 'package:shahe_flutter_app/me/system_setup.dart';
import 'package:shahe_flutter_app/tab_navigator.dart';
import 'package:shahe_flutter_app/me/update_app.dart';
import 'package:shahe_flutter_app/test/http.dart';
import 'package:shahe_flutter_app/test/http_async.dart';
import 'package:shahe_flutter_app/test/share_prefs.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        fontFamily: 'aliIcon'
      ),
      home: LoginPage(),
      routes: <String,WidgetBuilder>{
        'about_soft':(BuildContext context)=>AboutSoftPage(),
        'setup':(BuildContext context)=>SetupPage(),
        'update_app':(BuildContext context)=>UpdateAppPage(),
        'tab_navigator':(BuildContext context)=>TabNavigator(),
        'http_test':(BuildContext context)=>HttpDemo(),
        'http_async_test':(BuildContext context)=>HttpAsyncDemo(),
        'share_prefs':(BuildContext context)=>SharePrefsDemo(),
      }
    );
  }
}

class RouteNavigatorState extends StatefulWidget {
  @override
  _RouteNavigatorStateState createState() => _RouteNavigatorStateState();
}

class _RouteNavigatorStateState extends State<RouteNavigatorState> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



