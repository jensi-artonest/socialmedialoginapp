// ignore_for_file: must_be_immutable, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialmedialoginapp/UI/Screen/SplashSection/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  SplashController con = Get.put(SplashController());

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Container(
        alignment: Alignment.center,
        child: Text(
            "Myglamm",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
        ),
      ),
    );
  }
}
