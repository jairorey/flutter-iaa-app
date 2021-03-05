import 'package:flutter/material.dart';

class BtnSuccess extends StatelessWidget {
  final String text;
  final Function onPressed;

  const BtnSuccess({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 2,
      highlightElevation: 5,
      shape: StadiumBorder(),
      color: Colors.blue,
      onPressed: this.onPressed,
      child: Container(
        child: Center(
            child: Text(
          this.text,
          style: TextStyle(color: Colors.white, fontSize: 17),
        )),
        width: double.infinity,
        height: 55,
      ),
    );
  }
}
