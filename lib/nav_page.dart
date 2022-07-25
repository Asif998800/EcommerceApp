import 'package:ecommerce/pages/home_page.dart';
import 'package:ecommerce/pages/profile_page.dart';
import 'package:flutter/material.dart';

import 'pages/cart_page.dart';
import 'pages/favorite_page.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {

  List pages = [
    HomePage(),
    Favorite(),
    CartPage(),
    Profile(),
  ];

  int _selectedIndex = 0;

  void _navigateNavBar(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateNavBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
        ],
      ),
    );
  }
}

