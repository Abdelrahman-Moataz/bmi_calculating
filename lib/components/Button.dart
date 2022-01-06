import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants.dart';


class BottomButton extends StatelessWidget {

  BottomButton({@required this.onTap, this.buttonTitle});

  final Function onTap;
  final String  buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,

        child: Container(child: Center(child: Text(buttonTitle,style: KLargeKeyButton,)),color: KBottomContainerColor,
          padding: EdgeInsets.only(bottom: 20.0),
          margin: EdgeInsets.only(top: 10.0),width: double.infinity,height: KBottomContainerHeight,));
  }
}
