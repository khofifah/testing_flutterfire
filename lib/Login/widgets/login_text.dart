import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginText extends StatelessWidget {
  String label;
  String methodText;
  Function onTap;

  LoginText({this.label, this.methodText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label),
        InkWell(
          child: Text(
            methodText,
            style: TextStyle(color: Colors.lightBlue),
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
