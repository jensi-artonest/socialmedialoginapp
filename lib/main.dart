// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialmedialoginapp/Infrastructure/Commons/Constants/app_pages.dart';
import 'package:socialmedialoginapp/Infrastructure/Language/translation_service.dart';
import 'package:socialmedialoginapp/UI/Screen/SplashSection/splash_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

   runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      home: SplashScreen(),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    ),
  );
}
