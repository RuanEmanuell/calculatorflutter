import 'package:flutter/material.dart';
import "../partials/numberbutton.dart";


class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState()=> _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{


  var firstNumber=[];
  
  @override
  Widget build(BuildContext context){
  var screenWidth=MediaQuery.of(context).size.width;
  var screenHeight=MediaQuery.of(context).size.height;
  return Scaffold(
    body: Center(
      child:Container(
        color:Colors.red,
        child: Column(
          children:[
            Container(
              padding:EdgeInsets.only(top: 50),
              margin:EdgeInsets.only(top: 50),
              height:screenHeight/4,
              width:screenWidth,
              color:Colors.red,
              child:Text(firstNumber.toString(), style:TextStyle(
                color:Colors.black,
                fontSize:50
              ))
            ),
            Container(
              height:screenHeight/1.334-50,
              width:screenWidth,
              color:Colors.blue,
              child:Column(
                children: [
                  Row(
                    children: [
                  NumberButton(number:"1", firstNumber: firstNumber,),
                  NumberButton(number:"2", firstNumber: firstNumber,),
                  NumberButton(number:"3", firstNumber: firstNumber,),
                  ]),
                   Row(
                    children: [
                  NumberButton(number:"4", firstNumber: firstNumber),
                  NumberButton(number:"5", firstNumber: firstNumber,),
                  NumberButton(number:"6", firstNumber: firstNumber,),
                  ]),
                   Row(
                    children: [
                  NumberButton(number:"7", firstNumber: firstNumber,),
                  NumberButton(number:"8", firstNumber: firstNumber,),
                  NumberButton(number:"9", firstNumber: firstNumber,),
                  ]),
                   Row(
                    children: [
                  NumberButton(number:"0", firstNumber: firstNumber,),
                  ]),
                ],
              )
            )
          ]
        ),
      )
      )
    );
  }

}


