import 'package:flutter/material.dart';

extension Mainnavigation on BuildContext {
  Future<dynamic> goto(Widget route) {
    return Navigator.push(
        this,
        MaterialPageRoute(
          builder: (context) => route,
        ));
  }
}
