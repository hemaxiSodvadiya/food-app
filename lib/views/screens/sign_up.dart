import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/views/common/common_textStyle.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'dart:ui' as ui;

import '../../controller/helpers/firebaseAuthHelper.dart';

import '../common/global.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? password;
  String? email;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_outlined,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  //Get.back();
                },
              ),
            ),
            const CustomText(
                text: 'Sign Up',
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w900,
                alignment: Alignment.topLeft),
            // Stack(
            //   alignment: Alignment.topLeft,
            //   children: [
            //     // Opacity(
            //     //   opacity: 0.75,
            //     //   child: CustomPaint(
            //     //     size: Size(width, (width * 0.69).toDouble()),
            //     //     //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            //     //     painter: RPSCustomPainter(),
            //     //   ),
            //     // ),
            //     // CustomPaint(
            //     //   size: Size(width, (width * 0.5833333333333334).toDouble()),
            //     //   //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            //     //   painter: RPSCustomPainter(),
            //     // ),
            //     IconButton(
            //       onPressed: () {
            //         Get.back();
            //         //   Navigator.of(context).pop();
            //       },
            //       icon: const Icon(
            //         Icons.arrow_back_outlined,
            //         size: 30,
            //         color: Colors.black,
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 40,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        onSaved: (val) {
                          email = val!;
                        },
                        validator: (val) {
                          (val!.isEmpty) ? 'Enter your email first' : null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          prefixIcon: Icon(
                            Icons.people,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          // border: myEnabledBorder(),
                          // enabledBorder: myEnabledBorder(),
                          // focusedBorder: myFocusBorder(),
                        )),
                    const SizedBox(height: 8),
                    TextFormField(
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        onSaved: (val) {
                          password = val!;
                        },
                        validator: (val) {
                          (val!.isEmpty) ? 'Enter your password first' : null;
                        },
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          // enabledBorder: myEnabledBorder(),
                          // focusedBorder: myFocusBorder(),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        onPressed: () async {
                          print("-------------------");
                          print("sign up start");
                          print("-------------------");
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            print("-------------------");
                            print("sign up start in if");
                            print("-------------------");
                            User? user = await FirebaseAuthHelper
                                .firebaseAuthHelper
                                .signUpUser(email: email!, password: password!);

                            if (user != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("Login Successful\nUID:${user.uid}"),
                                  backgroundColor: Colors.green,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                              Navigator.of(context).pop();
                              //    Get.back();
                              // Navigator.of(context).pop();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Login Failed"),
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            }
                            Navigator.of(context).pop();
                            // Get.back();
                            emailController.clear();
                            passwordController.clear();

                            setState(() {
                              email = "";
                              password = "";
                            });
                          } else {
                            Navigator.of(context).pop();
                            // Get.back();
                            //Navigator.of(context).pop();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 120),
                            backgroundColor: Colors.green,
                            // fixedSize: const Size(300, 100),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text(
            //       "Already have an account?",
            //       style: TextStyle(fontSize: 10, color: Colors.black),
            //     ),
            //     TextButton(
            //       onPressed: () {
            //         setState(() {
            //           Get.toNamed('/login_page');
            //           //Navigator.of(context).pushNamed('login');
            //         });
            //       },
            //       child: const Text(
            //         "Login",
            //         style: TextStyle(
            //             fontSize: 16,
            //             color: Colors.white,
            //             fontWeight: FontWeight.w900),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 65,
            ),
          ],
        ),
      ),
    );
  }
}
