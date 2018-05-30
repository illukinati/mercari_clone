import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/screens/home_screen.dart';
import 'package:ecommerce_flutter/screens/item_screen.dart';
import 'package:ecommerce_flutter/screens/anjay.dart';

class MyNavigator {
  static final routes = <String, WidgetBuilder>{
    '/home': (BuildContext context) => HomePage(),
    '/item': (BuildContext context) => ItemsPage(),
    '/anjay': (BuildContext context) => Anjay(),
  };

  static void goToWelcome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, '/anjay', (Route<dynamic> route) => false);
  }

  static void goToHome(BuildContext context) {
    Navigator.of(context).pushNamed('/home');
  }

  static void goToItem(BuildContext context) {
    Navigator.of(context).pushNamed('/anjay');
  }
}
