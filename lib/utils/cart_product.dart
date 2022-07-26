import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Image
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset('assets/images/iphone.jpg',height: 130,)),
              ),
              SizedBox(width: 20),
              //Product details
              Container(
                child: Column(
                  children: [
                    Text('Iphone 12',style: TextStyle(fontSize: 18),),
                    SizedBox(height: 10),
                    Text('New edition',style: TextStyle(color: Colors.black54),),
                  ],
                ),
              ),
            ],
          ),
          //Price
          Container(
            child: Column(
              children: [
                Text('35.00',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Text('3',style: TextStyle(color: Colors.black54),),
                      SizedBox(width: 5),
                      Icon(Icons.keyboard_arrow_down,color: Colors.black54,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
