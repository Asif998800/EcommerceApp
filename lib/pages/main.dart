import 'package:ecommerce/pages/product_page.dart';
import 'package:ecommerce/pages/sign_up.dart';
import 'package:ecommerce/pages/user_info_form.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'home_page.dart';
import '../nav_page.dart';
import 'sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CartPage(),
    );
  }
}

