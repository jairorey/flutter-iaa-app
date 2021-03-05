import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String text;

  const Logo({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        width: 250,
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('assets/logo_1.png'),
            ),
            Text(
              this.text,
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
