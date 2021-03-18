import 'package:flutter/material.dart';

Future<void> showLoading(BuildContext context) async {
  showDialog<dynamic>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      dialogContext = context;
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    },
  );
}

Future<void> hideLoading(BuildContext context) async {
  Navigator.pop(context);
}
