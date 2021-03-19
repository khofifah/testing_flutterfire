import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/Login/view_models/sign_view_model.dart';
import 'package:learning_flutter/Login/widgets/login_text.dart';
import 'package:learning_flutter/utils/app_sizes%20copy.dart';
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
  bool isSignUp = true;

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
                  } else if (value.length < 6) {
                    return 'Password minimal 6 karakter';
                  }
                },
              ),
              SizedBox(height: 15),
              CustomButton(
                label: isSignUp == true ? 'Sign Up' : 'Sign In',
                onPressed: () async {
                  if (formKey.currentState.validate()) {
                    showLoading(context);
                    isSignUp == true
                        ? await sign.signUp(email.text, password.text).then(
                            (value) {
                              hideLoading(context);
                              PopupStatus.showFlushbar(
                                context,
                                value.status,
                                value.message,
                              );
                              if (value.status == true) {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    'home', (Route<dynamic> route) => false);
                              }
                            },
                          )
                        : await sign.signIn(email.text, password.text).then(
                            (value) {
                              hideLoading(context);
                              PopupStatus.showFlushbar(
                                context,
                                value.status,
                                value.message,
                              );
                              if (value.status == true) {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    'home', (Route<dynamic> route) => false);
                              }
                            },
                          );
                  }
                },
              ),
              SizedBox(height: Sizes.s15),
              isSignUp == false
                  ? LoginText(
                      label: 'Belum punya akun? ',
                      methodText: 'Buat akun',
                      onTap: () {
                        setState(() {
                          isSignUp = true;
                        });
                      },
                    )
                  : LoginText(
                      label: 'Sudah punya akun? ',
                      methodText: 'Masuk akun',
                      onTap: () {
                        setState(() {
                          isSignUp = false;
                        });
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
