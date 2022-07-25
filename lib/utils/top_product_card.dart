import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  String title, price;



  ProductCard({required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network('https://images.unsplash.com/photo-1658148902877-e40d0d70f22a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
              height: 150,),
            ),
          ),
          SizedBox(height: 5),
          Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
          Text(price,style: TextStyle(color: Colors.black54),),
        ],
      ),
    );
  }
}
