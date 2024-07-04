import 'package:flutter/material.dart';
import 'package:water_supply_app/signup_screen.dart';
// import 'package:water_supply_app/supplier_screens/product_detail.dart';
// import 'package:http/http.dart' as http;
// import 'package:water_supply_app/customer_screens/bottom_nav.dart';
// import 'package:water_supply_app/signup_screen.dart';
// import 'package:water_supply_app/supplier_screens/home_screen.dart';
// import 'package:water_supply_app/supplier_screens/splash_screen.dart';
// import 'package:water_supply_app/customer_screens/bottom_nav.dart';
// import 'package:water_supply_app/supplier_screens/order_listing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
      // initialRoute: '/',
      // routes: {
      //   // When navigating to the "/" route, build the FirstScreen widget.
      //   '/': (context) => SignUpScreen(),
        // 'productdetails': (context) => ProductDetail(imageUrl: imageUrl, title: title, description: description, price: price)
      // },
    );
  }
}
