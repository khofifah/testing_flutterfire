import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class PopupStatus {
  static void showFlushbar(BuildContext context, bool status, String value) {
    IconData icon;
    Color color = Colors.blueAccent;
    if (status == true) {
      icon = Icons.check;
      color = Colors.greenAccent;
    } else {
      icon = Icons.warning;
      color = Colors.orangeAccent;
    }
    Flushbar(
      message: value,
      // flushbarPosition: FlushbarPosition.TOP,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      duration: Duration(seconds: 3),
      icon: Icon(
        icon,
        color: color,
      ),
    )..show(context);
  }
}
