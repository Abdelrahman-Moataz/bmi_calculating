import 'package:bmi_calculator/components/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_contant.dart';
import 'package:bmi_calculator/Constants.dart';
import 'result_page.dart';
import 'package:bmi_calculator/components/Button.dart';
import 'package:bmi_calculator/Calculator_Brain.dart';

enum Gender {male, female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = KInActiveCardColor;
  Color femaleCardColor = KInActiveCardColor;

  Gender sGender;
  int height = 180;
  int weight = 60;
  int age    = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column( crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

//This one for the Male section
        Expanded(child: Row(children: [
          Expanded(child: Useable(onPress: (){setState(() {sGender = Gender.male;});}
          ,colour: sGender == Gender.male? KActiveCardColor : KInActiveCardColor,
            cardChild: IconeContent(icon: FontAwesomeIcons.mars,label: 'MALE',), ),),

// THis widget for the Female section
          Expanded(child: Useable(onPress: (){setState(() { sGender = Gender.female;
          });}  ,colour: sGender == Gender.female ? KActiveCardColor : KInActiveCardColor,
            cardChild: IconeContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),))
        ],)),

// this one for Slider widget
        Expanded(child: Useable(colour: KActiveCardColor, cardChild: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("HEIGHT", style: KLabelTextStyle,),
          Row( mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.baseline,
               textBaseline: TextBaseline.alphabetic,
            children:
          [Text(height.toString(),style: KNumberTextStyle,),
            Text('cn',style: KLabelTextStyle,),
          ],),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: Color(0xFF8D8E98),
                activeTrackColor: Colors.white,
                thumbColor: Color(0xFFEB1555),
                overlayColor: Color(0x29EB1555),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
              ),
              child: Slider(value: height.toDouble(), min: 120.0,max: 220.0,
                onChanged: (double newValue){setState(() {
                  height = newValue.round();
                });},),
            )
        ],),),),

// this Widget for the weight section
        Expanded(child: Row(children: [
          Expanded(child: Useable(colour: KActiveCardColor, cardChild: Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('WEIGHT',style: KLabelTextStyle,), Text(weight.toString(),style: KNumberTextStyle,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){setState(() {weight--;});},),
                SizedBox(width: 10.0),
                RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){setState(() {weight++;});},)

                ],)
            ],),)),

//This one for the age section
          Expanded(child: Useable(colour: KActiveCardColor, cardChild: Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('AGE',style: KLabelTextStyle,), Text(age.toString(),style: KNumberTextStyle,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){setState(() {age--;});},),
              SizedBox(width: 10.0),
              RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){setState(() {age++;});},)
            ],)],

          ),))
        ],),),
        
        BottomButton(onTap: (){
          CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
          Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
            bmiResult: calc.calculateBMI(),
            resultText: calc.getResult(),
            interpretation: calc.getInterpretation(),
          )));},
                      buttonTitle: 'CALCULATE',),
      ],)
    );
  }
}










