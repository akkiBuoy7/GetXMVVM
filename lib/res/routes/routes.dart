import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/login_screen.dart';
import 'package:getx_mvvm/view/splash_screen.dart';
class AppRoutes{

  static appRoutes() => [
    GetPage(name: RouteNames.splashScreen,
    page:()=> SplashScreen(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: Duration(seconds: 1)),
    GetPage(name: RouteNames.loginScreen,
        page:()=> LoginScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(seconds: 1))
  ];
}