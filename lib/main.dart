import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/navigations/my_navigator.dart';
import 'package:ecommerce_flutter/screens/home_screen.dart';

void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new HomePage(),
      theme: new ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.teal[200],
      ),
      routes: MyNavigator.routes,
    );
  }
}
