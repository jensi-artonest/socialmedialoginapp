// ignore_for_file: prefer_const_constructors, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialmedialoginapp/UI/Screen/HomeSection/home_screen.dart';
import 'package:socialmedialoginapp/UI/Screen/LoginSection/Widget/resgister_screen.dart';
import 'package:socialmedialoginapp/UI/Screen/LoginSection/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController e1 = TextEditingController();
  TextEditingController p1 = TextEditingController();
  LoginController login = Get.put(LoginController());
  SharedPreferences? logindata;
  bool? newuser;

  @override
  void initState() {
    super.initState();
  }

  // ignore: non_constant_identifier_names
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata?.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Get.to(const HomeScreen());
    }
  }

  @override
  void dispose() {
    e1.dispose();
    p1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text("Login"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: e1,
                cursorColor: Colors.purple,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  floatingLabelStyle: TextStyle(color: Colors.purple),
                  label: Text(
                    "E-mail",
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: p1,
                cursorColor: Colors.purple,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple)),
                  floatingLabelStyle: TextStyle(color: Colors.purple),
                  border: OutlineInputBorder(),
                  label: Text("password"),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  var res = await login.createuser(e1.text, p1.text);
                  // ignore: unnecessary_string_interpolations
                  Get.snackbar("Login", "$res");
                  if (res == "Success") {
                    Get.to(
                      const HomeScreen(),
                    );
                  }
                  String username = e1.text;
                  String password = p1.text;
                  if (username == '' && password == '') {
                    print('Successfull');
                    logindata?.setBool('login', false);
                    logindata?.setString('username', username);
                    Get.toNamed('');
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child: Text("Login"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Get.to(RegisterScreen());
                },
                child: const Text(
                  "create account | Sign in",
                  style: TextStyle(color: Colors.purple),
                ),
              ),
              GestureDetector(
                onTap: () {
                  login.signInWithFacebook();
                  Get.off(
                    const HomeScreen(),
                  );
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  shadowColor: Colors.purple,
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Image.asset("assets/images/facebook.png"),
                        SizedBox(
                          width: 15,
                        ),
                        Text("Login With Facebook"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
