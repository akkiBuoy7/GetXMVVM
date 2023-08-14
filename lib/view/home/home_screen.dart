import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/general_exception_widget.dart';
import 'package:getx_mvvm/res/strings/strings.dart';
import 'package:getx_mvvm/view_models/controller/home/home_view_model.dart';

import '../../data/status.dart';
import '../../res/components/internet_exception_widget.dart';
import '../../res/components/list_view_container_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeViewModel = Get.put(HomeViewModel());

  @override
  void initState() {
    homeViewModel.getUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.logout))
        ],
        automaticallyImplyLeading: false,
        title: const Text("Home"),
      ),
      body: Obx(() {
        switch (homeViewModel.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.ERROR:
            if (homeViewModel.error.value == AppStrings.internetNotConnected) {
              return Center(
                child: InternetExceptionWidget(onRetry: () {
                  homeViewModel.getUserList();
                }),
              );
            } else {
              return Center(
                child: GeneralExceptionWidget(onRetry: () {
                  homeViewModel.getUserList();
                }),
              );
            }
          case Status.COMPLETED:
            return ListViewContainerWidget(homeViewModel: homeViewModel);
        }
      }),
    );
  }
}

