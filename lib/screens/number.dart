import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:async";
import "dart:convert";



class NumberScreen extends StatefulWidget{

  NumberScreen({Key? key, 
  this.numeroConcurso, 
  this.buttonStyle, 
  this.inputDecoration}) : super(key: key);

  var numeroConcurso;
  var buttonStyle;
  var inputDecoration;

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
  String token="Sua key da API aqui";

  var textStyleBig=TextStyle(
                    fontSize:25
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
        backgroundColor:Color.fromRGBO(194, 49, 143, 1),
        title:Text("Conferir resultado")
      ),
      body: Center(
        child: loading ? CircularProgressIndicator(
          color:Color.fromRGBO(194, 49, 143, 1)
        ) : ListView(
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
                                          color:Color.fromRGBO(194, 49, 143, 1),
                                          border:Border.all(
                                          color:Color.fromARGB(255, 131, 25, 94),
                                          width:5),
                                          borderRadius:BorderRadius.circular(20)
                                        ),
                                        child:Text(data["dezenas"][index], style:TextStyle(
                                          fontSize: screenWidth>400? 30:15,
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
                          margin:EdgeInsets.only(top: 10),
                          child:Column(
                            children:[
                              Text("Checar seus acertos", style:textStyleBig),
                              Container(
                                margin:EdgeInsets.all(10),
                                child: TextField(  
                                  decoration:widget.inputDecoration,
                                  keyboardType:TextInputType.number,
                                  controller:controller,
                                  maxLength:2
                                ),
                              ),
                              !avisoMaior15 ? ElevatedButton(
                                style:widget.buttonStyle,
                                onPressed:(){
                                    if(controller.text.isNotEmpty){
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
                                        avisoMesmoNumero=false;
                                      });
                                      //Se o número digitado estiver entre os sorteados
                                      if(data["dezenas"].contains(controller.text)){
                                      setState((){
                                        acertos++;
                                      });
                                        }
                                       }
                                      }else{
                                    setState((){
                                      avisoMaior15=true;
                                    });
                                  }
                                 }
                                },
                                child:Text("Checar") 
                              ): Container(),
                              Container(height: 10),
                              Text("Você colocou ${ultimoNumero.length} números"),
                              Text("e você acertou $acertos números"),
                              Container(height: 10),
                              avisoMesmoNumero ? Text("Você já colocou esse número") : Container(),
                              avisoMaior15 ? Text("Você já colocou 15 números") : Container(),
                              Container(
                                margin:EdgeInsets.only(top: 10),
                                child:ElevatedButton(
                                  style:widget.buttonStyle,
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


