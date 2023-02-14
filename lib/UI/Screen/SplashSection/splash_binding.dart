import 'package:get/get.dart';
import 'package:socialmedialoginapp/UI/Screen/SplashSection/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}