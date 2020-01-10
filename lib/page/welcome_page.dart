import 'dart:async';

import 'package:flutter/cupertino.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    countdown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return backgound();
  }

  void countdown() {
    Timer timer = new Timer(new Duration(seconds: 3), () {
      Navigator.pushNamed(context, 'login_page');
      this.dispose();
    });
  }
}

backgound() {
  return FractionallySizedBox(
      heightFactor: 1,
      child: Image.asset('images/wel_bg.png', fit: BoxFit.fill));
}
