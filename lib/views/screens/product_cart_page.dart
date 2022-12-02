import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../controller/helpers/firebaseAuthHelper.dart';
import '../common/product_card.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    User? data = ModalRoute.of(context)!.settings.arguments as User?;
    return Scaffold(
      key: globalKey,
      drawer: Drawer(
        backgroundColor: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 18),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey,
                backgroundImage: (data?.photoURL != null)
                    ? NetworkImage("${data!.photoURL}")
                    : null,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: (data?.displayName != null)
                  ? Text(
                      "Name: -${data!.displayName}",
                      style: TextStyle(color: Colors.white),
                    )
                  : const Text(
                      "Name: -",
                      style: TextStyle(color: Colors.white),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: (data?.email != null)
                  ? Text(
                      "Email: -${data!.email}",
                      style: TextStyle(color: Colors.white),
                    )
                  : const Text(
                      "Email: -",
                      style: TextStyle(color: Colors.white),
                    ),
            ),
            Spacer(flex: 5),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen),
                  onPressed: () async {
                    await FirebaseAuthHelper.firebaseAuthHelper.signOut();

                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/signin_page', (route) => false);
                  },
                  child: Text(
                    "Log out",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  )),
            ),
            Spacer(),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        globalKey.currentState!.openDrawer();
                      },
                      child: Center(
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Food App",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 24,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),

                  /// image ...
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                      // image: NetworkImage("${data!.photoURL}")
                      image: DecorationImage(
                        image: NetworkImage("${data!.photoURL}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Text(
                "Hi ${data?.displayName}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFF459f2e),
                ),
              ),

              const SizedBox(height: 8),
              const Text(
                "Find your food",
                style: TextStyle(
                  fontSize: 28,
                  letterSpacing: 0.3,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 18),
              TextField(
                cursorHeight: 20,
                autofocus: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: "Search Food",
                  hintStyle: TextStyle(
                      fontSize: 17,
                      color: Colors.green,
                      fontWeight: FontWeight.w900),
                  prefixIcon:
                      Icon(Icons.search, color: Colors.green.withOpacity(0.7)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  suffixIcon: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              //CategoryCard(),

              ProductCart_Page(),
            ],
          ),
        ),
      ),
    );
  }
}
