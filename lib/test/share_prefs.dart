import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SharePrefsDemo extends StatefulWidget {
  @override
  _SharePrefsState createState() => _SharePrefsState();
}

class _SharePrefsState extends State<SharePrefsDemo> {
  int counter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SharedPreferences'),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Text((counter == null ? 0 : counter).toString()),
              RaisedButton(
                onPressed: _incrementCounter,
                child: Text('Increment Counter'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = (prefs.getInt('counter') ?? 0) + 1;
    });

    await prefs.setInt('counter', counter);
  }
}
