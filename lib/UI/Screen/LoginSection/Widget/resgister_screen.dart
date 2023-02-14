// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialmedialoginapp/UI/Screen/LoginSection/login_controller.dart';
import 'package:socialmedialoginapp/UI/Screen/LoginSection/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController e1 = TextEditingController();
  TextEditingController p1 = TextEditingController();
  LoginController login1 = Get.put(LoginController());
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("Register"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                cursorColor: Colors.purple,
                controller: e1,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                  floatingLabelStyle: TextStyle(color: Colors.purple),
                  border: OutlineInputBorder(),
                  label: Text("E-mail"),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                cursorColor: Colors.purple,
                controller: p1,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                  floatingLabelStyle: TextStyle(color: Colors.purple),
                  border: OutlineInputBorder(),
                  label: Text("password"),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  var res = await login1.createuser(e1.text, p1.text);
                  if (res == "Success") {
                    Get.to(
                      LoginScreen(),
                    );
                    login1.cheakUser();
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child: Text("Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
