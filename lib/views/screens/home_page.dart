import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

import '../../controller/helpers/firebaseAuthHelper.dart';
import '../common/common_textStyle.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}
//
// Color(0xffFFCB2B),
// Color(0xffF5820D),

class _HomePagesState extends State<HomePages> {
  static GlobalKey<FormState> formKeySignIn = GlobalKey<FormState>();

  static TextEditingController emailSignInController = TextEditingController();
  static TextEditingController passwordSignInController =
      TextEditingController();

  String? password;
  String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  alignment: Alignment.topLeft,
                  text: "Welcome",
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pushNamed('/sign_up');
                      // Get.toNamed('/sign_up');
                    });
                  },
                  child: CustomText(
                    alignment: Alignment.topRight,
                    text: "Sign Up",
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const CustomText(
              alignment: Alignment.topLeft,
              text: "Sign in to Continue",
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(
              height: 80,
            ),
            Form(
              key: formKeySignIn,
              child: Column(
                children: [
                  TextFormField(
                      onSaved: (val) {
                        email = val!;
                      },
                      validator: (val) {
                        (val!.isEmpty) ? 'Enter your email first' : null;
                      },
                      controller: emailSignInController,
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
                      onSaved: (val) {
                        password = val!;
                      },
                      validator: (val) {
                        (val!.isEmpty) ? 'Enter your password first' : null;
                      },
                      controller: passwordSignInController,
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
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        print("*******************");

                        if (formKeySignIn.currentState!.validate()) {
                          formKeySignIn.currentState!.save();

                          User? user = await FirebaseAuthHelper
                              .firebaseAuthHelper
                              .signInUser(email: email!, password: password!);
                          print("*******************");
                          print("enter....");
                          print("*******************");

                          if (user != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text("Login Successful\nUID:${user.uid}"),
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                            //Get.back();
                            //  Get.toNamed('/dashboard', arguments: user);
                            Navigator.of(context).pushReplacementNamed(
                                '/dashboard',
                                arguments: user);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Login Failed"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                            print("closed....");
                          }

                          emailSignInController.clear();
                          passwordSignInController.clear();

                          setState(() {
                            email = "";
                            password = "";
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 120),
                          backgroundColor: Colors.green,
                          // fixedSize: const Size(300, 100),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                      text:
                          '---------------------------------------- OR -----------------------------------------',
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      alignment: Alignment.center),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: OutlinedButton(
                        onPressed: () async {
                          User? user = await FirebaseAuthHelper
                              .firebaseAuthHelper
                              .signInWithGoogle();
                          if (user != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Successfully signed in with google"),
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                            print("++++++++++++++++1");
                            Navigator.of(context).pushReplacementNamed(
                                '/dashboard',
                                arguments: user);
                            //  Get.toNamed('/dashboard', arguments: user);
                            print("------------0");
//
// Navigator.of(context).pushReplacementNamed('dashboard');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("signed in with google Failed"),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                            print("closed....");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 80),

                            // fixedSize: const Size(300, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                        child: CustomText(
                          text: 'Sign in with Google',
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          alignment: Alignment.center,
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Scaffold(
// backgroundColor: Colors.white,
// body: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 20, right: 20),
// child: ElevatedButton(
// onPressed: () {
// setState(() {
// // Navigator.of(context).pushNamed('login');
// Get.toNamed('/login_page');
// });
// },
// style: ElevatedButton.styleFrom(
// padding:
// const EdgeInsets.symmetric(vertical: 12, horizontal: 130),
// backgroundColor: const Color(0xffFFCB2B),
// // fixedSize: const Size(300, 100),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(50))),
// child: const Text(
// "LOGIN",
// style: TextStyle(
// fontSize: 20,
// color: Colors.black,
// fontWeight: FontWeight.w900),
// ),
// ),
// ),
// const SizedBox(
// height: 30,
// ),
// OutlinedButton(
// onPressed: () {
// setState(() {
// Get.toNamed('/sign_up');
// // Navigator.of(context).pushNamed('sign_Up');
// });
// },
// child: const Text(
// "SIGN UP",
// style: TextStyle(
// fontSize: 20,
// color: Colors.white,
// fontWeight: FontWeight.w900),
// ),
// style: OutlinedButton.styleFrom(
// padding:
// const EdgeInsets.symmetric(vertical: 12, horizontal: 130),
// side: const BorderSide(color: Color(0xffF5820D), width: 3),
// // fixedSize: const Size(300, 100),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(50))),
// ),
// const SizedBox(
// height: 30,
// ),
// Row(children: const [
// Expanded(
// child: Divider(
// color: Colors.white,
// indent: 10,
// endIndent: 10,
// )),
// Text(
// "OR",
// style: TextStyle(fontSize: 16, color: Colors.white),
// ),
// Expanded(
// child: Divider(
// color: Colors.white,
// indent: 10,
// endIndent: 10,
// ))
// ]),
// const SizedBox(
// height: 30,
// ),
// InkWell(
// onTap: () async {
// User? user = await FirebaseAuthHelper.firebaseAuthHelper
//     .signInWithGoogle();
// if (user != null) {
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(
// content: Text("Successfully signed in with google"),
// backgroundColor: Colors.green,
// behavior: SnackBarBehavior.floating,
// ),
// );
// print("++++++++++++++++1");
// Get.toNamed('/dashboard');
// print("------------0");
// //
// // Navigator.of(context).pushReplacementNamed('dashboard');
// } else {
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(
// content: Text("signed in with google Failed"),
// backgroundColor: Colors.red,
// behavior: SnackBarBehavior.floating,
// ),
// );
// print("closed....");
// }
// },
// child: Container(
// height: 80,
// width: 80,
// child: Icon(Icons.facebook),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(100),
// border: Border.all(
// width: 3,
// color: Color(0xffF5820D),
// style: BorderStyle.solid,
// ),
// ),
// ),
// ),
// ],
// ),
// );
