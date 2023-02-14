import 'package:get/get.dart';
import 'package:socialmedialoginapp/Infrastructure/Commons/Constants/app_routes.dart';
import 'package:socialmedialoginapp/UI/Screen/HomeSection/home_binding.dart';
import 'package:socialmedialoginapp/UI/Screen/HomeSection/home_screen.dart';
import 'package:socialmedialoginapp/UI/Screen/LoginSection/Widget/resgister_screen.dart';
import 'package:socialmedialoginapp/UI/Screen/LoginSection/login_binding.dart';
import 'package:socialmedialoginapp/UI/Screen/LoginSection/login_screen.dart';

class AppPages{
  // static const INITIAL = RoutesConstants.splashScreen;
  static final routes =[
    GetPage(
      name: RoutesConstants.loginScreen,
      page: () => LoginScreen(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: RoutesConstants.registerScreen,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: RoutesConstants.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBindings(),
    ),
  ];
}
