import 'package:get/get.dart';
import 'package:socialmedialoginapp/UI/Screen/HomeSection/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}