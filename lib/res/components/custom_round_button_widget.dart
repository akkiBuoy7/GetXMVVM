import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/colors/AppColors.dart';

class CustomRoundButtonWidget extends StatelessWidget {
  const CustomRoundButtonWidget(
      {Key? key,
      required this.title,
      required this.onPress,
      this.loading = false,
      this.height = 50,
      this.width = 90,
      this.textColor = AppColors.whiteColor,
      this.buttonColor = AppColors.primaryColor})
      : super(key: key);

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(30)),
        child: loading ? const Center(child: CircularProgressIndicator(
          color: AppColors.whiteColor,
        )) : Center(
            child: Text(title,style: const TextStyle(color: AppColors.whiteColor),),),
      ),
    );
  }
}
