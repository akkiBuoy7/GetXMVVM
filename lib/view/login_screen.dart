import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/custom_round_button_widget.dart';
import 'package:getx_mvvm/res/strings/strings.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginViewModel = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppStrings.login),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginViewModel.emailController.value,
                    focusNode: loginViewModel.emailFocusNode.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        AppUtils.toastMessageBottom(AppStrings.emailValidation);
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: AppStrings.emailHint.tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: loginViewModel.passwordController.value,
                    focusNode: loginViewModel.passwordFocusNode.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        AppUtils.toastMessageBottom(
                            AppStrings.passwordValidation);
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: AppStrings.passwordHint.tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            CustomRoundButtonWidget(
                title: AppStrings.login.tr,
                onPress: () {
                  if (_formKey.currentState!.validate()) {}
                })
          ],
        ),
      ),
    );
  }
}
