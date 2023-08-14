import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/colors/AppColors.dart';
import 'package:getx_mvvm/res/strings/strings.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onRetry;

  const InternetExceptionWidget({Key? key, required this.onRetry})
      : super(key: key);

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.15,
          ),
          const Icon(
            Icons.cloud_off,
            color: AppColors.redColor,
            size: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                AppStrings.internetNotConnected.tr,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          GestureDetector(
            onTap: widget.onRetry,
            child: Container(
              height: 44,
              width: 150,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  AppStrings.retry.tr,
                  style: const TextStyle(color: AppColors.whiteColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
