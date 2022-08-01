import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../bottom_nav_controller.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  List<String> gender = ["Male","Female","Other"];

  Future<void> _selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year),
    );
    if (picked != null)
      setState(() {
        _dobController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
  }
  
  sendUserDataToDB()async {

    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;

    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('user-form-data');
    return _collectionRef.doc(currentUser!.email).set({
      "name":_nameController.text,
      "phone":_phoneController.text,
      "dob":_dobController.text,
      "gender":_genderController.text,
      "age":_ageController.text,
    }).then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=>BottomNavController()))).catchError((error)=>print("Somethimg is wrong. $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // margin: EdgeInsets.only(top: 60,left: 20),
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Submit the form to continue.',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),),
                Text('We will not share your information with anyone',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black45),),
                SizedBox(height: 50),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _dobController,
                  decoration: InputDecoration(
                    hintText: 'Date of Birth',
                    suffixIcon: IconButton(
                      onPressed: () => _selectDateFromPicker(context),
                      icon: Icon(Icons.calendar_today_outlined),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _genderController,
                  decoration: InputDecoration(
                    hintText: 'Gender',
                    suffixIcon: DropdownButton<String>(
                      items: gender.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                          onTap: () {
                            setState(() {
                              _genderController.text = value;
                            });
                          },
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _ageController,
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
                  onPressed: () {
                    sendUserDataToDB();
                  },
                  child: Text('Submit',style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
