import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/utils/shop_cart_slider.dart';
import 'package:flutter/material.dart';

import '../utils/product_image_slider.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //App Bar
          Container(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 24, left: 15, right: 15),
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.red.shade400,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //Image Slider
          SizedBox(height: 20),
          Expanded(child: ProductDetailsSlidder()),
          //Dot Indicator
          Container(
            height: 50,
            color: Colors.red,
          ),
          SizedBox(height: 20),
          //Product Details
         Container(
           height: 250,
           margin: EdgeInsets.only(left: 10,bottom: 15),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Leather Shoe",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
               SizedBox(height: 20),
               Text("149.99",style: TextStyle(fontSize: 15),),
               SizedBox(height: 20),
               TextField(
                 maxLines: 5, //or null
                 decoration: InputDecoration.collapsed(hintText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
               ),
               SizedBox(height: 20),
               Container(
                 margin: EdgeInsets.only(left: 10,right: 10),
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     primary: Colors.red,
                     minimumSize: Size.fromHeight(40), // fromHeight use double.infinity as width and 40 is the height
                   ),
                   onPressed: () {},
                   child: Text('ADD TO CART'),
                 ),
               ),
             ],
           ),
         ), //Add to cart
        ],
      ),
    );
  }
}
