import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_mvvm/res/colors/AppColors.dart';

class AppUtils {
  static void fieldFocusChange(
      BuildContext context, FocusNode currentNode, FocusNode nextNode) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  static toastMessageBottom(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColors.blackColor,
        gravity: ToastGravity.BOTTOM);
  }

  static toastMessageCenter(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColors.blackColor,
        gravity: ToastGravity.CENTER);
  }

  static snackBar(String title, String message) {
    Get.snackbar(title, message);
  }
}
