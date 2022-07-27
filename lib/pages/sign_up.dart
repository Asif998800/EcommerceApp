import 'package:ecommerce/pages/home_page.dart';
import 'package:ecommerce/pages/login_page.dart';
import 'package:ecommerce/pages/user_info_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  signUp()async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );
      var authCredential = userCredential.user;
      if (authCredential!.uid.isNotEmpty){
        Navigator.push(context, CupertinoPageRoute(builder: (_)=>UserForm()));
      }
      else{
        Fluttertoast.showToast(msg: "Something is wrong");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: "The account already exists for that email.");
      }
    } catch (e) {
      print(e);
    }
  }

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
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
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
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.red),
                        prefixIcon: Icon(Icons.email,color: Colors.red,),
                      ),),
                      SizedBox(height: 5),
                      TextField(
                        controller: _passwordController,
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
                        onPressed: () {
                          signUp();
                        },
                        child: Text('Continue',style: TextStyle(fontSize: 18),),
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, CupertinoPageRoute(builder: (_)=>LoginPage()));
                            },
                            child: const Text('Sign In',style: TextStyle(color: Colors.red),),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
