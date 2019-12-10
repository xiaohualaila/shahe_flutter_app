import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[topContent(), bottomContent()],
      ),
    );
  }



  topContent() {
    return Text('上面');

  }

  bottomContent() {
    return Text('下面');

  }
}
