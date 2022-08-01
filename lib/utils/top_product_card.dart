import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../pages/product_page.dart';


class ProductCard extends StatefulWidget {

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  CollectionReference _products = FirebaseFirestore.instance.collection('products');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _products.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: streamSnapshot.data!.docs.length,
          itemBuilder: (context,index) {
            DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
            return GestureDetector(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails())),
              child: Card(
                elevation: 10,
                child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 5,right: 5),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(documentSnapshot["img-path"][0],
                          height: 150,),
                      ),
                      SizedBox(height: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(documentSnapshot["name"],style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(documentSnapshot["price"],style: TextStyle(color: Colors.black54),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

// Container(
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Card(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10.0),
//               child: Image.network('https://images.unsplash.com/photo-1658148902877-e40d0d70f22a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
//               height: 150,),
//             ),
//           ),
//           SizedBox(height: 5),
//           Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold),),
//           Text(widget.price,style: TextStyle(color: Colors.black54),),
//         ],
//       ),
//     );