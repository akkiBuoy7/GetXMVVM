import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';

class SplashService{

  void isLogin(){
    Timer(Duration(seconds: 3), ()=> Get.toNamed(RouteNames.loginScreen));
  }
}