import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/top_product_card.dart';
import 'cart_page.dart';
import 'favorite_page.dart';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Container MyProduct(String imageval, String heading, String subHeading) {
    return Container(
      width: 120,
      child: Card(
        child: Wrap(
          children: [
            Image.network(imageval),
            ListTile(
              title: Text(heading),
              subtitle: Text(subHeading),
            ),
          ],
        ),
      ),
    );
  }

  Container MyAccesceries(String imageval, String heading, String subHeading) {
    return Container(
      width: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Wrap(
          children: [
            Image.network(imageval),
            ListTile(
              title: Text(heading),
              subtitle: Text(subHeading),
            ),
          ],
        ),
      ),
    );
  }

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1605457867610-e990b192418e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=826&q=80',
    'https://images.unsplash.com/photo-1499952127939-9bbf5af6c51c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80',
    'https://images.unsplash.com/photo-1470093851219-69951fcbb533?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
  ];

  List<String> _carouselImages = [];
  var _dotPosition = 0;

  fetchCarouselImages() async {
    var _firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot qn =
    await _firestoreInstance.collection("carousel-slider").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(
          qn.docs[i]["img-path"],
        );
        print(qn.docs[i]["img-path"]);
      }
    });

    return qn.docs;
  }

  @override
  void initState() {
    fetchCarouselImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            children: [
              //App Bar
              Center(
                child: Container(
                    margin: EdgeInsets.only(
                      top: 30,
                    ),
                    child: Text(
                      'Ecommerce',
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(height: 10),
              //Search Product
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Search products here',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45)),
                    suffixIcon: Container(
                      color: Colors.red,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              //App Banner
              Container(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.all(10)),
                    AspectRatio(
                      aspectRatio: 2.4,
                      child: CarouselSlider(
                          items: _carouselImages
                              .map((item) => Padding(
                            padding: const EdgeInsets.only(left: 3, right: 3),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(item),
                                      fit: BoxFit.fitWidth)),
                            ),
                          ))
                              .toList(),
                          options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 0.8,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                              onPageChanged: (val, carouselPageChangedReason) {
                                setState(() {
                                  _dotPosition = val;
                                });
                              })),
                    ),
                  ],
                ),
              ),   //CarouselSlider
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Products',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'View All',
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward_ios_outlined, color: Colors.red),
                      ],
                    ),
                  ),
                ],
              ),
              //Top Product List
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                height: 200,
                child: ProductCard(),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Accesceries',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'View All',
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward_ios_outlined, color: Colors.red),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                height: 240,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    MyAccesceries(
                        'https://images.unsplash.com/photo-1658140918789-fb22d2ad7e93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                        'Fareri',
                        'Sports Car'),
                    MyAccesceries(
                        'https://images.unsplash.com/photo-1658148902877-e40d0d70f22a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                        'Fareri',
                        'Sports Car'),
                    MyAccesceries(
                        'https://images.unsplash.com/photo-1658107294711-76054f4621ac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                        'Fareri',
                        'Sports Car'),
                    MyAccesceries(
                        'https://images.unsplash.com/photo-1658023495319-2786b348d829?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=385&q=80',
                        'Fareri',
                        'Sports Car'),
                    MyAccesceries(
                        'https://images.unsplash.com/photo-1658153254049-2d14c2eb98b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                        'Fareri',
                        'Sports Car'),
                    MyAccesceries(
                        'https://images.unsplash.com/photo-1658140918789-fb22d2ad7e93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                        'Fareri',
                        'Sports Car'),
                  ],
                ),
              ),  //Top Accescories List
            ],
          ),
        ),
      ),
    );
  }
}
