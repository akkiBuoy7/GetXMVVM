import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/app_exceptions.dart';
import 'package:getx_mvvm/res/localization/strings.dart';
import 'package:getx_mvvm/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(AppStrings.app.tr,
    )),
    floatingActionButton: FloatingActionButton(
    onPressed: (){
    Utils.toastMessageCenter("message");
    },
    )
    ,
    );
  }
}
