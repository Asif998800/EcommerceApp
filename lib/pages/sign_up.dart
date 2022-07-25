import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.red,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 70,left: 20),
              child: Text('Sign Up',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
            Container(
              margin: EdgeInsets.only(top: 140),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 200,left: 20),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text('Welcome Buddy!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red),),
                          SizedBox(height: 5),
                          Text('Glad to see you my buddy',
                            style: TextStyle(fontSize: 15,color: Colors.black45),),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    TextField(decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.red),
                      prefixIcon: Icon(Icons.email,color: Colors.red,),
                    ),),
                    SizedBox(height: 5),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.red),
                        prefixIcon: Icon(Icons.lock,color: Colors.red,),
                      ),),
                    SizedBox(height: 70),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(340, 50),
                        primary: Colors.red, // background
                        onPrimary: Colors.white, // foreground
                        elevation: 20,
                      ),
                      onPressed: () {},
                      child: Text('Continue',style: TextStyle(fontSize: 18),),
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont have an account?'),
                        SizedBox(width: 5),
                        Text('Sign In',style: TextStyle(color: Colors.red),),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
