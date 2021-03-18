import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/Login/view_models/login_google_view_model.dart';
import 'package:learning_flutter/Login/view_models/sign_view_model.dart';
import 'package:learning_flutter/widgets/custom_button.dart';
import 'package:learning_flutter/widgets/custom_input_text.dart';
import 'package:learning_flutter/widgets/loading.dart';
import 'package:learning_flutter/widgets/popup_status.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final sign = Provider.of<SignViewModel>(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInputText(
                controller: email,
                label: 'Email',
                isEmail: true,
                hint: 'khof@khof.khof',
                validator: (String value) {
                  if (value.length < 1) {
                    return 'Email tidak boleh kosong';
                  } else if (EmailValidator.validate(value) != true) {
                    return 'Format Email salah';
                  }
                },
              ),
              SizedBox(height: 15),
              CustomInputText(
                controller: password,
                label: 'Password',
                isPass: true,
                validator: (String value) {
                  if (value.length < 1) {
                    return 'Password tidak boleh kosong';
                  } else if (value.length < 3) {
                    return 'Password minimal 3 karakter';
                  }
                },
              ),
              SizedBox(height: 15),
              CustomButton(
                label: 'Sign Up',
                onPressed: () async {
                  if (formKey.currentState.validate()) {
                    showLoading(context);
                    await sign.signUp(email.text, password.text).then(
                      (value) {
                        PopupStatus.showFlushbar(
                          context,
                          value.status,
                          value.message,
                        );
                        if (value.status == true) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/', (Route<dynamic> route) => false);
                        }
                      },
                    );
                    hideLoading(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
