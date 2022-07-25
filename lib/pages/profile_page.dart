import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
                  Text('Profile',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Visibility(
                    child: Icon(Icons.shopping_cart_outlined),
                    visible: false,
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            //Profile Section
            Container(
              child: Column(
                children: [
                  //Profile Pic
                  Container(
                    width: 135,
                    height: 135,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/profile_pic.jpg'),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Raj Sharma",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            SizedBox(height: 60),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Edit Profile',style: TextStyle(fontWeight: FontWeight.bold),),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text('Favorite',style: TextStyle(fontWeight: FontWeight.bold),),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Change Address',style: TextStyle(fontWeight: FontWeight.bold),),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                    ListTile(
                      leading: Icon(Icons.ac_unit_sharp),
                      title: Text('Logout',style: TextStyle(fontWeight: FontWeight.bold),),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
