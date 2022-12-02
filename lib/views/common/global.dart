// // class Global {
// //   static String email = "";
// //   static String password = "";
// //   static String signInEmail = "";
// //   static String signInPassword = "";
// // }
//
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
//
//
// class Global {
//   static String? email;
//   static String? password;
//   static Color color = Colors.teal;
//   static List<DrawerModel> drawerList = [
//     DrawerModel(icon: Icons.person, name: "Profile"),
//     DrawerModel(icon: Icons.add_shopping_cart, name: "Cart"),
//     DrawerModel(icon: Icons.shop, name: "Order"),
//     DrawerModel(icon: Icons.lock, name: "Change"),
//     DrawerModel(icon: Icons.exit_to_app, name: "Log Out"),
//   ];
//   static List<Food> foodList = [
//     Food(
//         name: 'Pizza',
//         image: 'https://freepngimg.com/thumb/pizza/2-pizza-png-image.png',
//         price: 1200,
//         time: '20min',
//         isFavorite: false,
//         rate: 4.5),
//     Food(
//         name: 'Burger',
//         image: 'https://www.dlf.pt/dfpng/maxpng/370-3702980_hamburger-png.png',
//         price: 1200,
//         time: '20min',
//         isFavorite: false,
//         rate: 4.5),
//     Food(
//         name: 'Sandwich',
//         image:
//             'https://pluspng.com/img-png/sandwich-hd-png-sandwich-png-image-2594.png',
//         price: 200,
//         time: '20min',
//         isFavorite: false,
//         rate: 4.3),
//     Food(
//         name: 'Burger',
//         image:
//             'https://tse1.mm.bing.net/th?id=OIP.387PojRI5pukjUndARHSuAHaE8&pid=Api&P=0',
//         price: 1200,
//         time: '20min',
//         isFavorite: false,
//         rate: 4.5),
//     Food(
//         name: 'Pizza',
//         image:
//             'https://www.franchiseelites.com/wp-content/uploads/2017/08/Pizza-Free-PNG-Image1.png',
//         price: 450,
//         time: '12min',
//         isFavorite: false,
//         rate: 4.3),
//     Food(
//         name: 'Burger',
//         image:
//             'https://purepng.com/public/uploads/medium/purepng.com-fast-food-burgerburgerfast-foodhammeatfast-food-burgermc-donaldsburger-king-231519340201mh7zr.png',
//         price: 200,
//         time: '3min',
//         isFavorite: false,
//         rate: 4.7),
//   ];
//
//   static List<Fruits> fruitsList = [
//     Fruits(
//         name: 'Apple',
//         image:
//             'https://freepngimg.com/download/apple/20-green-apples-png-image.png',
//         price: 250,
//         time: '10min',
//         isFavorite: false,
//         rate: 5),
//     Fruits(
//         name: 'Banana',
//         image:
//             'https://www.pngpix.com/wp-content/uploads/2016/03/Bunch-of-Bananas-PNG-image.png',
//         price: 120,
//         time: '10min',
//         isFavorite: false,
//         rate: 4.1),
//     Fruits(
//         name: 'Grepes',
//         image:
//             'https://purepng.com/public/uploads/large/purepng.com-grapesgrapeberryfruitwine-331522414914lrzvf.png',
//         price: 250,
//         time: '10min',
//         isFavorite: false,
//         rate: 5),
//     Fruits(
//         name: 'Dragon-Fruits',
//         image:
//             'http://good-fortune.2u.life/content/images/thumbs/0001255_-red-dragon-fruit-08-1lb_550.png',
//         price: 110,
//         time: '10min',
//         isFavorite: false,
//         rate: 5),
//     Fruits(
//         name: 'Painpple',
//         image:
//             'https://freepngimg.com/thumb/pineapple/2-2-pineapple-picture.png',
//         price: 250,
//         time: '10min',
//         isFavorite: false,
//         rate: 5),
//     Fruits(
//         name: 'Orange',
//         image:
//             "https://purepng.com/public/uploads/large/purepng.com-orangesorangefruitfoodtastydeliciousorangecolor-3315225826354ezzx.png",
//         price: 250,
//         time: '10min',
//         isFavorite: false,
//         rate: 5),
//   ];
//   //vegetables
//   static List<Vegetable> VegetableList = [
//     Vegetable(
//         name: 'Acorn squash',
//         image: 'https://www.pngmart.com/files/5/Acorn-Squash-PNG-Image.png',
//         price: 120,
//         time: '5min',
//         isFavorite: false,
//         rate: 4.1),
//     Vegetable(
//         name: 'Bitter melon',
//         image:
//             'https://purepng.com/public/uploads/large/purepng.com-bitter-gourdvegetables-bitter-melon-bitter-gourd-momordica-charantia-bitter-squash-balsam-pear-941524726197qszna.png',
//         price: 110,
//         time: '2min',
//         isFavorite: false,
//         rate: 4.2),
//     Vegetable(
//         name: 'Butternut squash',
//         image:
//             'https://www.buildingblockassociates.com/uploads/2/0/3/6/20363055/s988221189447504472_p24_i1_w1600.png',
//         price: 130,
//         time: '10min',
//         isFavorite: false,
//         rate: 4.3),
//     Vegetable(
//         name: 'Delicata',
//         image:
//             'https://www.localseeds.com.au/wp-content/uploads/2020/07/squash.png',
//         price: 140,
//         time: '5min',
//         isFavorite: false,
//         rate: 4.4),
//     Vegetable(
//         name: 'Gem squash',
//         image: 'https://www.pngmart.com/files/5/Acorn-Squash-PNG-Pic.png',
//         price: 150,
//         time: '6min',
//         isFavorite: false,
//         rate: 4.5),
//     Vegetable(
//         name: 'Marrow',
//         image: 'https://pngimg.com/uploads/marrow/marrow_PNG12.png',
//         price: 200,
//         time: '11min',
//         isFavorite: false,
//         rate: 4.6),
//   ];
//   static List<Grocery> groceryList = [
//     Grocery(
//         name: 'Chips',
//         image:
//             'https://tse1.mm.bing.net/th?id=OIP.DUiM0CXaOhCGb2RhaWITOgHaE7&pid=Api&P=0',
//         price: 100,
//         time: "5min",
//         isFavorite: false,
//         rate: 4.5),
//     Grocery(
//         name: 'Doritos chips',
//         image:
//             'https://tse1.mm.bing.net/th?id=OIP.H6S1JEnGi_Lp-8kxTY_ZUwHaHa&pid=Api&P=0',
//         price: 40,
//         time: '7min',
//         isFavorite: false,
//         rate: 5),
//     Grocery(
//         name: 'Lays chips',
//         image:
//             'https://tse1.mm.bing.net/th?id=OIP.hK9xXefrtzf_sG0TlT45YwHaEs&pid=Api&P=0',
//         price: 30,
//         time: '2min',
//         isFavorite: false,
//         rate: 4.3),
//     Grocery(
//         name: 'Cookies',
//         image:
//             'https://tse3.mm.bing.net/th?id=OIP.ZLj9MYZhVWqnhVUMNx0WyQHaEj&pid=Api&P=0',
//         price: 50,
//         time: '10min',
//         isFavorite: false,
//         rate: 5),
//     Grocery(
//         name: 'Potato chips',
//         image:
//             'https://tse1.mm.bing.net/th?id=OIP.dzYb1OwbP3COIvbvgypqNgAAAA&pid=Api&P=0',
//         price: 20,
//         time: '20min',
//         isFavorite: false,
//         rate: 4.0),
//     Grocery(
//         name: 'Terra chips',
//         image:
//             'https://tse1.mm.bing.net/th?id=OIP.lXqWGqkGdbd0ZVqIZugf-gHaE8&pid=Api&P=0',
//         price: 60,
//         time: '5min',
//         isFavorite: false,
//         rate: 5),
//   ];
// }

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/model/food_model.dart';
import 'package:provider/provider.dart';

import '../../controller/food_controller.dart';

List<FoodModel> products = [
  FoodModel(
    id: 1,
    name: "spring roll",
    price: 150,
    image: "assets/image/spring roll.jpg",
    quantity: 1,
    isLike: "false",
    prices: 150,
  ),
  FoodModel(
    id: 2,
    price: 280,
    image: "assets/image/salad.jpg",
    name: "salad",
    quantity: 1,
    isLike: "false",
    prices: 280,
  ),
  FoodModel(
    id: 3,
    price: 150,
    image: "assets/image/pizaa.jpg",
    name: "pizza",
    quantity: 1,
    isLike: "false",
    prices: 150,
  ),
  FoodModel(
    id: 4,
    price: 180,
    image: "assets/image/manchurian.jpg",
    name: "manchurian",
    quantity: 1,
    isLike: "false",
    prices: 180,
  ),
  FoodModel(
    id: 5,
    price: 250,
    image: "assets/image/momos.jpg",
    name: "momos",
    quantity: 1,
    isLike: "false",
    prices: 250,
  ),
  FoodModel(
    id: 6,
    price: 50,
    image: "assets/image/noodles.jpg",
    name: "noodles",
    quantity: 1,
    isLike: "false",
    prices: 50,
  ),
  FoodModel(
    id: 7,
    price: 200,
    image: "assets/image/lychee.jpg",
    name: "lychee",
    quantity: 1,
    isLike: "false",
    prices: 200,
  ),
  FoodModel(
    id: 8,
    price: 60,
    image: "assets/image/watermelon.jpg",
    name: "watermelon",
    quantity: 1,
    isLike: "false",
    prices: 60,
  ),
  FoodModel(
    id: 9,
    price: 80,
    image: "assets/image/guava.jpg",
    name: "guava",
    quantity: 1,
    isLike: "false",
    prices: 80,
  ),
  FoodModel(
    id: 10,
    price: 1000,
    image: "assets/image/whole grains.png",
    name: "whole grains",
    quantity: 1,
    isLike: "false",
    prices: 1000,
  ),
  FoodModel(
    id: 11,
    price: 800,
    image: "assets/image/mustard.jpg",
    name: "mustard",
    quantity: 1,
    isLike: "false",
    prices: 800,
  ),
  FoodModel(
    id: 12,
    name: "Basic Grocery",
    price: 300,
    image: "assets/image/gro3.png",
    quantity: 1,
    isLike: "false",
    prices: 300,
  ),
  FoodModel(
    id: 13,
    name: "Crude Grocery",
    price: 150,
    image: "assets/image/gro4.png",
    quantity: 1,
    isLike: "false",
    prices: 150,
  ),
  FoodModel(
    id: 14,
    name: "Cabbage",
    price: 40,
    image: "assets/image/cabbage.png",
    quantity: 1,
    isLike: "false",
    prices: 40,
  ),
  FoodModel(
    id: 15,
    name: "Mix Veges",
    price: 90,
    image: "assets/image/veg.png",
    quantity: 1,
    isLike: "false",
    prices: 90,
  ),
];

Widget productContainer(
    {required BuildContext context,
    required String image,
    required int id,
    required String name,
    required double price,
    required Function()? onTap,
    required Function()? plusButtonPressed}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Stack(
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          height: height * 0.32,
          width: width * 0.45,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  offset: const Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 9,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: (height * 0.26) / 1.5,
                width: width * 0.42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      image,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: -10,
                      right: -10,
                      child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () async {
                          Provider.of<ProductProvider>(context, listen: false)
                              .likeProduct(product: products[id]);
                          log(products[id].isLike, name: "Is Like");
                          log(id.toString(), name: "Index");
                        },
                        icon: (products[id].isLike == "true")
                            ? const Icon(
                                Icons.favorite,
                                size: 25,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                size: 25,
                                color: Color(0XFFBAC2CD),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Color(0XFF1E2126),
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "20min",
                    style: TextStyle(
                      color: Color(0XFFBAC2CD),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.star_rate_rounded,
                        color: Color(0XFFffc107),
                      ),
                      Text(
                        "2.5",
                        style: TextStyle(
                          color: Color(0XFFBAC2CD),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\$$price",
                    style: const TextStyle(
                      color: Color(0XFF1E2126),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      Positioned(
        bottom: -60,
        right: -60,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green,
          ),
          child: Align(
            alignment: const Alignment(-1.1, -1.1),
            child: IconButton(
              onPressed: plusButtonPressed,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 27,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
