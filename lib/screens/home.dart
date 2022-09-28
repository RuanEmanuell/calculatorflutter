import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:async";
import "dart:convert";


class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState()=> _HomeScreen();
}


class _HomeScreen extends State<HomeScreen>{

  TextEditingController controller=TextEditingController();

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
    var statusBarHeight=MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
              Container(
                child:Column(
                      children:[
                        Container(
                        margin:EdgeInsets.only(
                        top: statusBarHeight+10),
                        child: Text("Resultado do concurso ${data["numero_concurso"]}",
                        style:TextStyle(
                          fontSize:25
                          )
                        )),
                        GridView.count(
                              crossAxisCount:5,
                              shrinkWrap: true,
                            children:List.generate(data["dezenas"].length, (index) { 
                              return Container(
                                      margin:EdgeInsets.all(8),
                                      padding:EdgeInsets.all(8),
                                      decoration:BoxDecoration(
                                        color:Color.fromARGB(255, 75, 141, 76),
                                        border:Border.all(color:Colors.green,
                                        width:5),
                                        borderRadius:BorderRadius.circular(20)
                                      ),
                                      child:Text(data["dezenas"][index], style:TextStyle(
                                        fontSize:30,
                                        color:Colors.white
                                      ))
                                  );
                                }
                              )
                            )
                          ]
                         )
                      ),
                      Container(
                        margin:EdgeInsets.only(top: 20),
                        child:Column(
                          children:[
                            Text("Checar seus acertos"),
                            TextField(
                              controller:controller
                            ),
                            ElevatedButton(
                              onPressed:(){

                              },
                              child:Text("Checar")
                            ),
                            Text("Você acertou $acertos números")
                          
                          ]
                       )
                     )
                   ]
                  )
               ),
        );
  }



}


