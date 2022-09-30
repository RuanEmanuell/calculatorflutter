import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:async";
import "dart:convert";



//Tela de resultado

class NumberScreen extends StatefulWidget{

  //Requisitando os dados da tela anterior
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
  String token="4fnWe2wVb2iv2jm";

  var textStyleBig=const TextStyle(
                    fontSize:25
                   );


  //Função pra requisitar os dados do concurso que o usuário digitou
  Future requestData() async {
    var response= await http.get(Uri.parse("https://apiloterias.com.br/app/resultado?loteria=lotofacil&token=$token&concurso=${widget.numeroConcurso}"));
    if(response.statusCode==200){
    data=json.decode(response.body);
      setState((){
        loading=false;
      });
    }
  }

  @override
  void initState(){
    super.initState();
    requestData();
  }


  @override
  Widget build(BuildContext context){
    //Pegando a altura da status bar e largura da tela
    var statusBarHeight=MediaQuery.of(context).viewPadding.top;
    var screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        centerTitle:true,
        backgroundColor:const Color.fromRGBO(194, 49, 143, 1),
        title:const Text("Conferir resultado")
      ),
      body: Center(
        child: loading ? const CircularProgressIndicator(
          color:Color.fromRGBO(194, 49, 143, 1)
        ) : ListView(
          children: [
            Column(
              children: [
                Column(
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
                                        margin:const EdgeInsets.all(10),
                                        padding:const EdgeInsets.all(7.5),
                                        decoration:BoxDecoration(
                                          color:const Color.fromRGBO(194, 49, 143, 1),
                                          border:Border.all(
                                          color:const Color.fromARGB(255, 131, 25, 94),
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
                         ),
                        Container(
                          margin:const EdgeInsets.only(top: 10),
                            child:Column(
                              children:[
                                Text("Checar seus acertos", style:textStyleBig),
                                Container(
                                  margin:const EdgeInsets.all(10),
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
                                          controller.text="0${controller.text}";
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
                                child:const Text("Checar") 
                              ): Container(),
                              Container(height: 10),
                              Text("Você colocou ${ultimoNumero.length} números"),
                              Text("e você acertou $acertos números"),
                              Container(height: 10),
                              avisoMesmoNumero ? const Text("Você já colocou esse número") : Container(),
                              avisoMaior15 ? const Text("Você já colocou 15 números") : Container(),
                              Container(
                                margin:const EdgeInsets.only(top: 10),
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
                                    child:const Text("Reiniciar"),
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


