import 'package:flutter/material.dart';

import '../utils/cart_product.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

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
                  IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back),),
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
                    CartProduct(),
                    CartProduct(),
                    CartProduct(),
                    CartProduct(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            //Total Price
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',style: TextStyle(fontSize: 20,color: Colors.black54),),
                  Text('75.00',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],),
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
                    Text('Cheakout',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
