import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
                  margin:EdgeInsets.only(top: 30),
                  width:300,
                  height:100,
                  child: Column(
                    children: [
                      TextField(
                        controller:firstController,
                        keyboardType:TextInputType.number,
                        decoration:InputDecoration(
                          hintText:"Resultado do jogo"
                        )
                      ),
                      ElevatedButton(
                        onPressed:(){
                          setState((){
                           resultado=[];
                           resultado.add(firstController.text);
                           print(resultado);
                          });
                        },
                        child:Text("Enviar")
                      )
                    ],
                  ),
                ),
                Container(
                  width:300,
                  height:100,
                  child: Column(
                    children: [
                      TextField(
                        controller:secondController,
                        keyboardType:TextInputType.number,
                        decoration:InputDecoration(
                          hintText:"Digite uma coluna de números"
                        )
                      ),
                      ElevatedButton(
                        onPressed:(){
                          setState(() {
                           numeros=[];
                           numeros.add(secondController.text);
                           print(numeros);
                          });
                        },
                        child:Text("Enviar")
                      )
                    ],
                  ),
                ),
                Container(
                  child:Column(
                    children: [
                      Container(height: 50),
                      ElevatedButton(
                        child:Text("Checar"),
                        onPressed:(){

                        }
                      ),
                      Text("Voce acertou ${acertos} números"),
                    ],
                  )
                )
          ],
        ),
      )
    );
  }



}


