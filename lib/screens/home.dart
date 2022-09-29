import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:async";
import "dart:convert";
import "number.dart";


class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState()=> _HomeScreen();
}


class _HomeScreen extends State<HomeScreen>{

  TextEditingController controller=TextEditingController();

    var data;

  
  @override
  Widget build(BuildContext context){
    var statusBarHeight=MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller:controller
            ),
            ElevatedButton(
              onPressed:(){
                Navigator.push(context,
                MaterialPageRoute(
                  builder:(context)=>NumberScreen(
                    numeroConcurso:controller.text
                  )
                ));
              },
              child:Text("Hi")
            ),
          ],
        )
      )
      );
  }



}


