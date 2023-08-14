import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/assets/image_assets.dart';
import 'package:getx_mvvm/res/strings/strings.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/services/splash_service.dart';

import '../res/components/custom_round_button_widget.dart';
import '../res/components/general_exception_widget.dart';
import '../res/components/internet_exception_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashService splashService = SplashService();

  @override
  void initState() {
    splashService.isLogin();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        AppStrings.app.tr,
      )),
      body: Center(
        child: Image.asset(AppImageAssets.splashLogo),
      ),
    );
  }
}
