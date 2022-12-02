// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:food_app/views/screens/cart_page.dart';
// import 'package:food_app/views/screens/dashboard.dart';
// import 'package:food_app/views/screens/home_page.dart';
// import 'package:food_app/views/screens/intro_page.dart';
// import 'package:food_app/views/screens/product_detail.dart';
// import 'package:food_app/views/screens/sign_up.dart';
// import 'package:get/get.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await Firebase.initializeApp();
//   runApp(
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/intro_page',
//       getPages: [
//         GetPage(
//           name: '/intro_page',
//           page: () => IntroPage(),
//         ),
//         GetPage(name: '/dashboard', page: () => Dashboard()),
//         GetPage(name: '/home_page', page: () => HomePages()),
//         GetPage(name: '/sign_up', page: () => SignUp()),
//         GetPage(name: '/cart_page', page: () => CartPage()),
//         GetPage(name: '/product_detail', page: () => ProductPage()),
//
//         //   GetPage(name: '/login_page', page: () => Login())
//       ],
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_app/views/screens/cart_page.dart';
import 'package:food_app/views/screens/dashboard.dart';
import 'package:food_app/views/screens/home_page.dart';
import 'package:food_app/views/screens/intro_page.dart';
import 'package:food_app/views/screens/product_detail.dart';
import 'package:food_app/views/screens/product_cart_page.dart';
import 'package:food_app/views/screens/sign_up.dart';
import 'package:provider/provider.dart';

import 'controller/food_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => ProductProvider())],
    builder: (context, _) => MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/introscreen',
      routes: {
        '/home_page': (context) => const HomePages(),
        '/introscreen': (context) => const IntroPage(),
        '/sign_up': (context) => SignUp(),
        '/dashboard': (context) => const Dashboard(),

        '/cart_page': (context) => const CartPage(),
        '/product_detail': (context) => const FoodPage(),
        '/product_detail': (context) => const ProductDetails(),
        // '/splash_screen': (context) => SplashScreen()
      },
    ),
  ));
}
