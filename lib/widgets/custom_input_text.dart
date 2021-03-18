import 'package:flutter/material.dart';
import 'package:learning_flutter/utils/app_sizes.dart';

// ignore: must_be_immutable
class CustomInputText extends StatelessWidget {
  TextEditingController controller;
  Function validator;
  String label, hint;
  bool isEmail, isPass;

  CustomInputText({
    this.controller,
    this.validator,
    this.label,
    this.hint,
    this.isEmail = false,
    this.isPass = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: Sizes.s16,
          ),
        ),
        SizedBox(height: Sizes.s10),
        SizedBox(
          width: double.infinity,
          child: TextFormField(
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint == null ? '' : hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.s25),
                borderSide: BorderSide(color: Colors.lightBlue),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.s25),
                borderSide: BorderSide(color: Colors.lightBlue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.s25),
                borderSide: BorderSide(color: Colors.lightBlue),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.s25),
                borderSide: BorderSide(color: Colors.lightBlue),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.s25),
                borderSide: BorderSide(color: Colors.lightBlue),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.s25),
                borderSide: BorderSide(color: Colors.lightBlue),
              ),
              isDense: true,
              contentPadding: EdgeInsets.all(Sizes.s15),
            ),
            keyboardType: isEmail == true ? TextInputType.emailAddress : null,
            obscureText: isPass,
          ),
        ),
      ],
    );
  }
}
