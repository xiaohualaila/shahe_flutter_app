
import 'package:flutter/cupertino.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        backgound(),
      ],
    );
  }
}
backgound() {
  return FractionallySizedBox(
      heightFactor: 1,
      child:Image.asset('images/wel_bg.png', fit: BoxFit.fill)
  );
}