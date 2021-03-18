import 'package:flutter/material.dart';
import 'package:learning_flutter/utils/app_sizes.dart';

class CustomButton extends StatelessWidget {
  String label;
  Function onPressed;

  CustomButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: Container(
          padding: EdgeInsets.all(Sizes.s15),
          child: Text(
            label,
            style: TextStyle(
              fontSize: Sizes.s16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
