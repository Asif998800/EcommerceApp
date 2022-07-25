import 'package:flutter/material.dart';

class ProductDetailsSlidder extends StatefulWidget {
  const ProductDetailsSlidder({Key? key}) : super(key: key);

  @override
  State<ProductDetailsSlidder> createState() => _ProductDetailsSlidderState();
}

class _ProductDetailsSlidderState extends State<ProductDetailsSlidder> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return _sliderBuilder(index);
        }
    );
  }
  Widget _sliderBuilder(int index) {
    return Container(
      child: Image.asset('assets/images/phone.jpg',fit: BoxFit.fill,),
    );
  }
}
