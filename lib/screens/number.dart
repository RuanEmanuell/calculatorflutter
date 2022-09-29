import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:async";
import "dart:convert";



class NumberScreen extends StatefulWidget{

  NumberScreen({Key? key, this.numeroConcurso}) : super(key: key);

  var numeroConcurso;

  @override
  _NumberScreen createState()=> _NumberScreen();
}


class _NumberScreen extends State<NumberScreen>{

  TextEditingController controller=TextEditingController();

  var data;
  var ultimoNumero=[];
  int acertos=0;
  bool loading=true;
  bool avisoMesmoNumero=false;
  bool avisoMaior15=false;
  String token="Seu token aqui";

  var textStyleBig=TextStyle(
                    fontSize:25
                   );

  var buttonStyle=ElevatedButton.styleFrom(
                   primary:Colors.green
                  );

  Future requestData() async {
    var response= await http.get(Uri.parse("https://apiloterias.com.br/app/resultado?loteria=lotofacil&token=$token&concurso=${widget.numeroConcurso}"));
    if(response.statusCode==200){
    data=json.decode(response.body);
      setState((){
        loading=false;
      });
    }
  }

  void initState(){
    super.initState();
    requestData();
  }


  @override
  Widget build(BuildContext context){
    var statusBarHeight=MediaQuery.of(context).viewPadding.top;
    var screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        centerTitle:true,
        backgroundColor:Colors.green,
        title:Text("Conferir resultado")
      ),
      body: Center(
        child: loading ? CircularProgressIndicator() : ListView(
          children: [
            Column(
            children: [
                Container(
                  child:Column(
                        children:[
                          Container(
                          margin:EdgeInsets.only(
                          top: statusBarHeight),
                          child: Text("Resultado do concurso ${data["numero_concurso"]}:",
                          style: textStyleBig
                          )),
                          GridView.count(
                                crossAxisCount:5,
                                shrinkWrap: true,
                              children:List.generate(data["dezenas"].length, (index) { 
                                return Container(
                                        margin:EdgeInsets.all(10),
                                        padding:EdgeInsets.all(7.5),
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
                              Text("Checar seus acertos", style:textStyleBig),
                              Container(
                                margin:EdgeInsets.all(10),
                                child: TextField(  
                                  decoration:InputDecoration(
                                    border:OutlineInputBorder(),
                                    hintText:"Digite um número"
                                  ),
                                  keyboardType:TextInputType.number,
                                  controller:controller,
                                  maxLength:2
                                ),
                              ),
                              ElevatedButton(
                                style:buttonStyle,
                                onPressed:(){
                                    //Se o usuário checou 15 números ou menos
                                    if(ultimoNumero.length<15){
                                      //Se o número tiver apenas 1 digito, adicionar o 0
                                      if(controller.text.length<2){
                                        controller.text="0"+controller.text;
                                      }
                                      //Se o usuário já digitou esse número
                                      if(ultimoNumero.contains(controller.text)){
                                      setState((){
                                        avisoMesmoNumero=true;
                                      });
                                      }else{
                                      setState((){
                                        ultimoNumero.add(controller.text);
                                      });
                                      //Se o número digitado estiver entre os sorteados
                                      if(data["dezenas"].contains(controller.text)){
                                      setState((){
                                        acertos++;
                                        avisoMesmoNumero=false;
                                      });
                                        }
                                       }
                                      }else{
                                    setState((){
                                      avisoMaior15=true;
                                    });
                                  }
                                },
                                child:Text("Checar")
                              ),
                              Text("Você colocou ${ultimoNumero.length} números"),
                              Text("e você acertou $acertos números"),
                              avisoMesmoNumero ? Text("Você já colocou esse número") : Container(),
                              avisoMaior15 ? Text("Você já colocou 15 números") : Container(),
                              Container(
                                margin:EdgeInsets.only(top: 10),
                                child:ElevatedButton(
                                  style:buttonStyle,
                                  onPressed:(){
                                    setState((){
                                      avisoMaior15=false;
                                      avisoMesmoNumero=false;
                                      ultimoNumero=[];
                                      acertos=0;
                                    });
                                  },
                                  child:Text("Reiniciar"),
                                )
                              )
                            
                            ]
                         )
                       )
                     ]
                    ),
            ]
         )
        ),
        );
  }



}


