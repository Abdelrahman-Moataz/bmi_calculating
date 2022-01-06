import 'dart:math';
import 'package:bmi_calculator/components/reusable_card.dart';

class CalculatorBrain{

  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);

  }
  String getResult (){
    if (_bmi >= 25){return "Over Weight!";}
    else if (_bmi > 18.5){return 'Normal';}
    else {return 'Under weight';}
  }

  String getInterpretation(){
    if (_bmi >= 25){return "You have higher than normal body weight. Try to exercise more";}
    else if (_bmi > 18.5){return 'Yoy have normal body weight. Good for u';}
    else {return 'You have a lower than normal body weight. You can eat a bit more';}
  }
}