import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_app/controller/helpers/food_hepler.dart';
import 'package:food_app/model/food_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:provider/provider.dart';

import '../../controller/food_controller.dart';
import 'global.dart';

class ProductCart_Page extends StatefulWidget {
  const ProductCart_Page({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductCart_Page> createState() => _ProductCart_PageState();
}

class _ProductCart_PageState extends State<ProductCart_Page> {
  late Future<RxList<FoodModel>> productDataList;
  late Future<List<FoodModel>> productList;

  bool foodSelected = true;
  bool fruitSelected = false;
  bool vegetableSelected = false;
  bool grocerySelected = false;

  void initState() {
    super.initState();
    productList = FoodHelper.foodHelper.fetchAllData();
    log(productList.toString(), name: "Product List Data");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () async {
                  setState(() {
                    foodSelected = true;
                    fruitSelected = false;
                    vegetableSelected = false;
                    grocerySelected = false;
                  });
                },
                child: Text(
                  "Food",
                  style: TextStyle(
                      color: (foodSelected) ? Colors.green : Colors.grey,
                      fontSize: 24,
                      fontWeight: FontWeight.w900),
                ),
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    foodSelected = false;
                    fruitSelected = true;
                    vegetableSelected = false;
                    grocerySelected = false;
                  });
                },
                child: Text(
                  "Fruits",
                  style: TextStyle(
                      color: (fruitSelected) ? Colors.green : Colors.grey,
                      fontSize: 24,
                      fontWeight: FontWeight.w900),
                ),
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    foodSelected = false;
                    fruitSelected = false;
                    vegetableSelected = true;
                    grocerySelected = false;
                  });
                },
                child: Text(
                  "Vegetables",
                  style: TextStyle(
                      color: (vegetableSelected) ? Colors.green : Colors.grey,
                      fontSize: 24,
                      fontWeight: FontWeight.w900),
                ),
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    foodSelected = false;
                    fruitSelected = false;
                    vegetableSelected = false;
                    grocerySelected = true;
                  });
                },
                child: Text(
                  "Grocery",
                  style: TextStyle(
                      color: (grocerySelected) ? Colors.green : Colors.grey,
                      fontSize: 24,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 700,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (foodSelected) ...[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        productContainer(
                          id: 1,
                          context: context,
                          image: "assets/image/spring roll.jpg",
                          name: "spring roll",
                          price: 150,
                          onTap: () {
                            Navigator.pushNamed(context, "/product_detail",
                                arguments: products[0]);
                          },
                          plusButtonPressed: () {
                            log("plus Tapped");
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[0]);
                          },
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        productContainer(
                          id: 2,
                          context: context,
                          image: "assets/image/salad.jpg",
                          name: "salad",
                          price: 280,
                          onTap: () {
                            Navigator.pushNamed(context, "/product_detail",
                                arguments: products[1]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[1]);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        productContainer(
                          id: 3,
                          context: context,
                          image: "assets/image/pizaa.jpg",
                          name: "pizza",
                          price: 150,
                          onTap: () {
                            Navigator.pushNamed(context, "/product_detail",
                                arguments: products[2]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[2]);
                          },
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        productContainer(
                          id: 6,
                          context: context,
                          image: "assets/image/noodles.jpg",
                          name: "noodles",
                          price: 50,
                          onTap: () {
                            Navigator.pushNamed(context, "/product_detail",
                                arguments: products[5]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[5]);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        productContainer(
                          id: 4,
                          context: context,
                          image: "assets/image/manchurian.jpg",
                          name: "manchurian",
                          price: 250,
                          onTap: () {
                            Navigator.pushNamed(context, "/product_detail",
                                arguments: products[4]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[4]);
                          },
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        productContainer(
                          id: 5,
                          context: context,
                          image: "assets/image/momos.jpg",
                          name: "momos",
                          price: 180,
                          onTap: () {
                            Navigator.pushNamed(context, "/product_detail",
                                arguments: products[3]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[3]);
                          },
                        ),
                      ],
                    ),
                  ),
                ] else if (fruitSelected) ...[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        productContainer(
                          id: 7,
                          context: context,
                          image: "assets/image/lychee.jpg",
                          name: "lychee",
                          price: 200,
                          onTap: () {
                            Navigator.pushNamed(context, "/product_detail",
                                arguments: products[6]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[6]);
                          },
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        productContainer(
                          id: 8,
                          context: context,
                          image: "assets/image/watermelon.jpg",
                          name: "watermelon",
                          price: 60,
                          onTap: () {
                            Navigator.pushNamed(context, "/product_detail",
                                arguments: products[7]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[7]);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      productContainer(
                        id: 9,
                        context: context,
                        image: "assets/image/guava.jpg",
                        name: "guava",
                        price: 80,
                        onTap: () {
                          Navigator.pushNamed(context, "/product_detail",
                              arguments: products[8]);
                        },
                        plusButtonPressed: () {
                          Provider.of<ProductProvider>(context, listen: false)
                              .addProduct(product: products[8]);
                        },
                      ),
                      productContainer(
                        id: 9,
                        context: context,
                        image: "assets/image/kiwi.jpg",
                        name: "kiwi",
                        price: 80,
                        onTap: () {
                          Navigator.pushNamed(context, "/product_detail",
                              arguments: products[8]);
                        },
                        plusButtonPressed: () {
                          Provider.of<ProductProvider>(context, listen: false)
                              .addProduct(product: products[8]);
                        },
                      ),
                    ],
                  ),
                ] else if (grocerySelected) ...[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        productContainer(
                          id: 10,
                          context: context,
                          image: "assets/image/whole grains.png",
                          name: "whole grains",
                          price: 1000,
                          onTap: () {
                            Navigator.pushNamed(context, "/product_detail",
                                arguments: products[9]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[9]);
                          },
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        productContainer(
                          id: 11,
                          context: context,
                          image: "assets/image/mustard.jpg",
                          name: "mustard",
                          price: 800,
                          onTap: () {
                            Navigator.pushNamed(context, "/product_detail",
                                arguments: products[10]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[10]);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        productContainer(
                          id: 12,
                          context: context,
                          image: "assets/image/grain.jpg",
                          name: "grain",
                          price: 300,
                          onTap: () {
                            Navigator.pushNamed(context, "/product_detail",
                                arguments: products[11]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[11]);
                          },
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        productContainer(
                          id: 13,
                          context: context,
                          image: "assets/image/turmeric.jpg",
                          name: "turmeric.jpg",
                          price: 150,
                          onTap: () {
                            Navigator.pushNamed(context, "/product_detail",
                                arguments: products[12]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[12]);
                          },
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            productContainer(
                              id: 13,
                              context: context,
                              image: "assets/image/cabbage.jpg",
                              name: "cabbage",
                              price: 40,
                              onTap: () {
                                Navigator.pushNamed(context, "/product_detail",
                                    arguments: products[12]);
                              },
                              plusButtonPressed: () {
                                Provider.of<ProductProvider>(context,
                                        listen: false)
                                    .addProduct(product: products[12]);
                              },
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            productContainer(
                              id: 11,
                              context: context,
                              image: "assets/image/broccoli.jpg",
                              name: "broccoli",
                              price: 90,
                              onTap: () {
                                Navigator.pushNamed(context, "/product_detail",
                                    arguments: products[12]);
                              },
                              plusButtonPressed: () {
                                Provider.of<ProductProvider>(context,
                                        listen: false)
                                    .addProduct(product: products[12]);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        productContainer(
                          id: 11,
                          context: context,
                          image: "assets/image/cucumber.jpg",
                          name: "cucumber",
                          price: 70,
                          onTap: () {
                            Navigator.pushNamed(context, "/product_detail",
                                arguments: products[12]);
                          },
                          plusButtonPressed: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .addProduct(product: products[12]);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
