import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteProduct extends StatelessWidget {
  const FavoriteProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
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
                    SizedBox(height: 10),
                    Text('35.00',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  ],
                ),
              ),
            ],
          ),
          //Price
          Container(
            child: Icon(Icons.delete)
          ),
        ],
      ),
    );
  }
}
