import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {

  TextEditingController _genderController = TextEditingController();
  List<String> gender = ["Male","Female","Other"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60,left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Submit the form to continue.',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),),
              Text('We will not share your information with anyone',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black45),),
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Full Name',
                ),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                ),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Date of Birth',
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _genderController,
                decoration: InputDecoration(
                  hintText: 'Gender',
                  // prefixIcon: DropdownButton<String>(
                  //   items: gender.map((String value) {
                  //     return DropdownMenuItem<String>(
                  //      value: value,
                  //      child: new Text(value),
                  //      onTap: () {
                  //        setState(() {
                  //          _genderController.text = value;
                  //        })
                  //      },
                  //     )
                  //   })
                  // );
                ),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Age',
                ),
              ),
              SizedBox(height: 90),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(340, 50),
                  primary: Colors.red, // background
                  onPrimary: Colors.white,
                  elevation: 20,// foreground
                ),
                onPressed: () {},
                child: Text('Submit',style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
