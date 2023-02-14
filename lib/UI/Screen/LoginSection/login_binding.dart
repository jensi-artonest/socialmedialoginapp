import 'package:get/get.dart';
import 'package:socialmedialoginapp/UI/Screen/LoginSection/login_controller.dart';

class LogInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}