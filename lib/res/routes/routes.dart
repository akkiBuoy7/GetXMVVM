import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/home/home_screen.dart';
import 'package:getx_mvvm/view/login/login_screen.dart';
import 'package:getx_mvvm/view/splash/splash_screen.dart';
class AppRoutes{

  static appRoutes() => [
    GetPage(name: RouteNames.splashScreen,
    page:()=> SplashScreen(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: Duration(seconds: 1)),
    GetPage(name: RouteNames.loginScreen,
        page:()=> LoginScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(seconds: 1)),
    GetPage(name: RouteNames.homeScreen,
        page:()=> HomeScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(seconds: 1))
  ];
}