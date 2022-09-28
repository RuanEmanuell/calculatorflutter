import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:async";
import "dart:convert";


class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState()=> _HomeScreen();
}


class _HomeScreen extends State<HomeScreen>{

  TextEditingController firstController=TextEditingController();
  TextEditingController secondController=TextEditingController();

  var acertos=0;
  var resultado=[];
  var numeros=[];
  var data;
  var token;

  Future requestData() async {
    var response= await http.get(Uri.parse("https://apiloterias.com.br/app/resultado?loteria=lotofacil&token=$token&concurso=2622"));
    if(response.statusCode==200){
    print(response.body);
    data=json.decode(response.body);
    }
  }

  void initState(){
    super.initState();
    requestData();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          children: [
              Text(data["dezenas"].toString())

            ]
        )
        ),
      );
  }



}


