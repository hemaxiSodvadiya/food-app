// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
// import '../model/food_model.dart';
//
// class foodCotroller extends GetxController {
//   List categoriesList = [].obs;
//   late CategoriesModel categoriesModel;
//   Future<void> getCategories() async {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection('categories')
//         .doc('JlFufQvmUgFYmTEGx55B')
//         .collection('burger')
//         .get();
//     // querySnapshot.docs.forEach((element) {
//     //   categoriesModel = CategoriesModel(
//     //       image: element.data()?['image'], name: element.data()!['name']);
//     // });
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:food_app/model/food_model.dart';

class ProductProvider extends ChangeNotifier {
  List<FoodModel> addedProduct = [];

  get totalPrice {
    double price = 0.0;
    for (FoodModel product in addedProduct) {
      price = (price + (product.price * product.quantity));
    }
    return price;
  }

  get totalProducts {
    int products = 0;
    for (FoodModel product in addedProduct) {
      products = products + product.quantity;
    }
    return products;
  }

  void addProduct({required FoodModel product}) {
    int tag = 0;
    for (FoodModel addProduct in addedProduct) {
      if (addProduct.id == product.id) {
        product.quantity = product.quantity + 1;
        addProduct.prices = addProduct.price * product.quantity;
        tag = 1;
        notifyListeners();
      }
      notifyListeners();
    }
    if (tag == 0) {
      addedProduct.add(product);
      notifyListeners();
    }
  }

  likeProduct({required FoodModel product}) {
    if (product.isLike == "false") {
      product.isLike = "true";
      notifyListeners();
    } else {
      product.isLike = "false";
      notifyListeners();
    }
  }

  void removeProduct({required FoodModel product}) {
    if (product.quantity > 1) {
      product.quantity = product.quantity - 1;
      product.prices = product.price * product.quantity;
      notifyListeners();
    } else {
      addedProduct.remove(product);
      notifyListeners();
    }
  }
}
