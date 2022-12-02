import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/views/screens/product_detail.dart';
import 'package:food_app/views/screens/product_cart_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../controller/food_controller.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  TextEditingController searchController = TextEditingController();

  List category = [
    'Food',
    'Fruits',
    'Vegetables',
    'Grocery',
  ];
  dynamic selected;
  // var heart = false;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    User? data = ModalRoute.of(context)!.settings.arguments as User?;

    return Scaffold(
      bottomNavigationBar: StylishBottomBar(
        backgroundColor: Colors.white,
        items: [
          AnimatedBarItems(
              icon: const Icon(
                Icons.house_outlined,
                size: 28,
              ),
              selectedColor: Colors.green,
              title: const Text('')),
          AnimatedBarItems(
              icon: const Icon(
                Icons.chat_outlined,
                size: 25,
              ),
              selectedIcon: const Icon(
                Icons.chat_outlined,
              ),
              selectedColor: Colors.green,
              backgroundColor: Colors.lightGreenAccent,
              title: const Text('')),
          AnimatedBarItems(
              icon: const Icon(
                Icons.notifications,
                size: 25,
              ),
              selectedColor: Colors.green,
              title: const Text('')),
          AnimatedBarItems(
              icon: const Icon(
                CupertinoIcons.heart,
                size: 25,
              ),
              selectedColor: Colors.green,
              title: const Text('Like')),
        ],
        iconSize: 32,
        barAnimation: BarAnimation.transform3D,
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        opacity: 0.3,
        currentIndex: selected ?? 0,
        onTap: (index) {
          controller.jumpToPage(index!);
          setState(() {
            selected = index;
          });
        },
      ),
      floatingActionButton: Container(
        height: 80,
        width: 60,
        child: Stack(
          children: [
            Positioned(
              bottom: 15,
              left: 2,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: Colors.green,
                onPressed: () {
                  // Get.toNamed('/cart_page');
                  Navigator.of(context).pushNamed("/cart_page");
                },
                tooltip: 'increment',
                elevation: 5,
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "${Provider.of<ProductProvider>(context).totalProducts}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: const [
            FoodPage(),
            Center(child: Text('Message')),

            Center(child: Text('Not Found')),
            Center(child: Text('Like')),

            // Center(child: Text("Cart")),
          ],
        ),
      ),
    );
  }

  void OnItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

//
// Scaffold(
// drawer: Container(
// height: double.infinity,
// width: 250,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.green,
// ),
// child: Drawer(
// backgroundColor: Colors.green.withOpacity(0.4),
// child: Column(
// children: [
// const SizedBox(
// height: 50,
// ),
// CircleAvatar(
// radius: 80,
// //backgroundImage: NetworkImage("${data?.photoURL}"),
// backgroundImage: (data?.photoURL == null)
// ? NetworkImage(
// "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOc9VDs02ZrmIC7pS3WzBTvXl8UrI3jwAOVQ&usqp=CAU")
// : NetworkImage("${data?.photoURL}"),
// //     ? NetworkImage("${data!.photoURL}")
// //       : NetworkImage(
// //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOc9VDs02ZrmIC7pS3WzBTvXl8UrI3jwAOVQ&usqp=CAU"),
// // //
// ),
// const SizedBox(
// height: 50,
// ),
// const Divider(
// color: Colors.white,
// ),
// const SizedBox(
// height: 30,
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// (data?.displayName != null)
// ? Text(
// "Name :- ${data?.displayName}",
// style: TextStyle(fontSize: 16, color: Colors.white),
// )
// : Text(
// "Uid :- ${data?.uid}",
// style: const TextStyle(
// fontSize: 16, color: Colors.white),
// ),
// const SizedBox(
// height: 20,
// ),
// (data?.email != null)
// ? Text(
// "Email :- ${data?.email}",
// style: const TextStyle(
// fontSize: 16, color: Colors.white),
// )
// : Text(
// "Email :-  --",
// style: TextStyle(fontSize: 16, color: Colors.white),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// // appBar: AppBar(
// //   backgroundColor: Colors.white,
// //   elevation: 0,
// //
// //   title: Row(
// //     crossAxisAlignment: CrossAxisAlignment.center,
// //     children: [
// //       IconButton(
// //           onPressed: () {},
// //           icon: Icon(
// //             Icons.location_pin,
// //             color: Colors.green,
// //           )),
// //       Text(
// //         'Magura,BD',
// //         style: TextStyle(fontSize: 20, color: Colors.grey),
// //       ),
// //     ],
// //   ),
// //   // leading: Container(
// //   //   height: 50,
// //   //   width: 50,
// //   //   child: Icon(
// //   //     Icons.menu,
// //   //     color: Colors.white,
// //   //     size: 25,
// //   //   ),
// //   //   decoration: BoxDecoration(
// //   //     borderRadius: BorderRadius.circular(10),
// //   //     color: Colors.green,
// //   //   ),
// //   // ),
// //   actions: [
// //     Container(
// //       height: 50,
// //       width: 50,
// //       child: (data?.photoURL == null)
// //           ? Image.asset("assets/image/person.png")
// //           : Image.network("${data?.photoURL}"),
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(10),
// //         color: Colors.green,
// //       ),
// //     ),
// //   ],
// // ),
//
// body: SingleChildScrollView(
// scrollDirection: Axis.vertical,
// child: Container(
// padding: EdgeInsets.only(left: 15, right: 15),
// child: Column(
// children: [
// SizedBox(
// height: 30,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: 50,
// width: 50,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.green,
// ),
// child: Builder(builder: (context) {
// return IconButton(
// onPressed: () {
// Scaffold.of(context).openDrawer();
// },
// icon: const Icon(Icons.menu));
// }),
// ),
// Row(
// children: [
// IconButton(
// onPressed: () {},
// icon: Icon(
// Icons.location_pin,
// color: Colors.green,
// )),
// Text(
// 'Magura,BD',
// style: TextStyle(fontSize: 20, color: Colors.grey),
// ),
// ],
// ),
// Container(
// height: 50,
// width: 50,
// child: (data?.photoURL == null)
// ? Image.asset("assets/image/person.png")
// : Image.network("${data?.photoURL}"),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.green,
// ),
// ),
// ],
// ),
// SizedBox(
// height: 25,
// ),
// Row(
// children: [
// (data?.displayName != null)
// ? Text(
// "Hi ${data?.displayName}",
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.w900,
// color: Colors.green),
// )
// : Text(
// "Hi ${data?.uid}",
// style: const TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.w900,
// color: Colors.green),
// ),
// const SizedBox(
// height: 20,
// ),
// ],
// ),
// SizedBox(
// height: 15,
// ),
// CustomText(
// text: 'Find your food',
// fontSize: 30,
// color: Colors.black,
// fontWeight: FontWeight.w900,
// alignment: Alignment.topLeft),
// // Container(
// //   color: Colors.green.withOpacity(0.2),
// //   child: TextFormField(
// //     controller: searchController,
// //     decoration: InputDecoration(
// //         hintText: 'Search Food',
// //         helperStyle: TextStyle(
// //             fontSize: 14,
// //             color: Colors.green,
// //             fontWeight: FontWeight.w900),
// //         border: InputBorder.none,
// //         prefixIcon: Icon(
// //           Icons.search,
// //           color: Colors.green,
// //         )),
// //   ),
// // ),
// Row(
// children: [
// Expanded(
// flex: 10,
// child: Container(
// color: Colors.green.withOpacity(0.2),
// child: TextFormField(
// controller: searchController,
// decoration: InputDecoration(
// hintText: 'Search Food',
// hintStyle: TextStyle(
// fontSize: 14,
// color: Colors.green,
// fontWeight: FontWeight.w900),
// border: InputBorder.none,
// prefixIcon: Icon(
// Icons.search,
// color: Colors.green,
// )),
// ),
// ),
// ),
// SizedBox(
// width: 8,
// ),
// Expanded(
// flex: 2,
// child: Container(
// height: 50,
// width: 50,
// child: Icon(Icons.filter_list),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.green,
// ),
// ),
// ),
// ],
// ),
// SizedBox(
// height: 15,
// ),
// Container(
// height: 50,
// child: ListView.builder(
// scrollDirection: Axis.horizontal,
// itemBuilder: (context, i) {
// return Container(
// padding: EdgeInsets.all(10),
// child: Text(
// "${category[i]}",
// style: TextStyle(
// color: Colors.green,
// fontSize: 25,
// fontWeight: FontWeight.w900),
// ),
// );
// },
// itemCount: category.length,
// ),
// ),
//
// Container(
// height: 350,
// child: ListView.separated(
// scrollDirection: Axis.horizontal,
// itemBuilder: (context, i) {
// return Column(
// children: [
// Container(
// width: MediaQuery.of(context).size.width * .42,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.green,
// ),
// child: Column(
// children: [
// Container(
// height: 200,
// child: Image.asset('assets/image/person.png'),
// ),
// Text('data'),
// ],
// ),
// ),
// ],
// );
// },
// separatorBuilder: (context, i) => SizedBox(
// width: 20,
// ),
// itemCount: category.length),
// ),
// Container(
// height: 350,
// child: ListView.separated(
// scrollDirection: Axis.horizontal,
// itemBuilder: (context, i) {
// return Column(
// children: [
// Container(
// width: MediaQuery.of(context).size.width * .42,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.green,
// ),
// child: Column(
// children: [
// Container(
// height: 200,
// child: Image.asset('assets/image/person.png'),
// ),
// Text('data'),
// ],
// ),
// ),
// ],
// );
// },
// separatorBuilder: (context, i) => SizedBox(
// width: 20,
// ),
// itemCount: category.length),
// ),
// ],
// ),
// ),
// ),
// backgroundColor: Colors.white,
// bottomNavigationBar: BottomNavigationBar(
// backgroundColor: Colors.white,
// selectedItemColor: Colors.green,
// unselectedItemColor: Colors.black,
// type: BottomNavigationBarType.fixed,
// currentIndex: _currentIndex,
// onTap: OnItemTapped,
// items: const <BottomNavigationBarItem>[
// BottomNavigationBarItem(
// icon: Icon(Icons.home),
// label: '',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.message),
// label: '',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.notifications),
// label: '',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.favorite_border_outlined),
// label: '',
// ),
// ],
// ),
// floatingActionButtonLocation:
// FloatingActionButtonLocation.miniCenterDocked,
// floatingActionButton: Container(
// height: 50,
// width: 50,
// child: Icon(
// Icons.shopping_cart,
// color: Colors.white,
// size: 25,
// ),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10),
// color: Colors.green,
// ),
// ),
// );
