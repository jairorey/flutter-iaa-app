import 'package:flutter/material.dart';
import 'package:iaa/routes/routes_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'chat',
      routes: appRoutes,
    );
  }
}
