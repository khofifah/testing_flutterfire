import 'package:flutter/material.dart';
import 'package:learning_flutter/utils/app_sizes%20copy.dart';
import 'package:learning_flutter/utils/app_sizes.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String label;
  Function onPressed;
  bool isGoogle;

  CustomButton({this.label, this.onPressed, this.isGoogle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: Container(
          padding: EdgeInsets.all(Sizes.s15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isGoogle == true
                  ? Image.asset('assets/images/google-logo.png')
                  : SizedBox(),
              SizedBox(width: isGoogle == true ? Sizes.s10 : 0),
              Text(
                label,
                style: TextStyle(
                  fontSize: Sizes.s16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
