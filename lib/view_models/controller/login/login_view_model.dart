import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/utils/utils.dart';

import '../../../res/routes/routes_name.dart';

class LoginViewModel extends GetxController {
  final _repo = LoginRepository();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool loading = false.obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  void loginUser() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text.toString(),
      'password': passwordController.value.text.toString()
    };
    _repo.loginUser(data).then((value) {
      loading.value = false;
      if (value['error'] == 'user not found') {
        AppUtils.snackBar('login', value['error']);
      } else {
        Get.toNamed(RouteNames.homeScreen);
        AppUtils.snackBar('login', "Success");
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print("#### ERROR: ${error.toString()}");
      }
      loading.value = false;
      AppUtils.snackBar('Error', error.toString());
    });
  }
}
