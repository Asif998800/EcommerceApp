import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({Key? key}) : super(key: key);

  Widget _sliderBuilder(index){
    return Container(
      height: 250,
      margin: EdgeInsets.only(left: 20,right: 20),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/phone.jpg'),fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        itemBuilder: (context, index) {
          return _sliderBuilder(index);
        },
        itemCount: 5, // Can be null
      ),
    );

  }
}
