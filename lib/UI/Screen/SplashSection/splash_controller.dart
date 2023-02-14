import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socialmedialoginapp/UI/Screen/HomeSection/home_screen.dart';
import 'package:socialmedialoginapp/UI/Screen/LoginSection/Widget/resgister_screen.dart';
import 'package:socialmedialoginapp/UI/Screen/LoginSection/login_screen.dart';


class SplashController extends GetxController {
  final Rx<GlobalKey> globalKey = GlobalKey().obs;

  Rx<GetStorage> getStorage = GetStorage().obs;
  @override
  void onInit() {
    time();
    super.onInit();
  }

  time() async {

    bool isNotVisit =
        getStorage.value.read(AutofillHints.email) ?? true;
    String? userId = getStorage.value.read(AutofillHints.password);
    Timer(const Duration(seconds: 3), () {
      isNotVisit
          ? Get.offAll(()=>LoginScreen())
          : userId == null
          ? Get.offAll(()=>RegisterScreen())
          : Get.offAll(()=>HomeScreen());
    });
  }
}
