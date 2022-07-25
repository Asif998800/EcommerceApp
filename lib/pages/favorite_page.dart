import 'package:flutter/material.dart';

import '../utils/cart_product.dart';
import '../utils/favorite_product.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //AppBar
            Container(
              height: 70,
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back),
                  Text('C A R T',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Visibility(
                    child: Icon(Icons.shopping_cart_outlined),
                    visible: false,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(height: 25),
            Expanded(
              child: Container(
                height: 130,
                child: ListView(
                  children: [
                    FavoriteProduct(),
                    FavoriteProduct(),
                    FavoriteProduct(),
                    FavoriteProduct(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            //Cheakout Button
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(left: 10,right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Add to Cart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
