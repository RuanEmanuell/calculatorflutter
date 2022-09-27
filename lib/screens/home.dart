import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState()=> _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{

  var number="";
  var firstNumber=[];
  var style=TextStyle(
    fontSize:30,
    color:Colors.white
  );
  
  @override
  Widget build(BuildContext context){
  var screenWidth=MediaQuery.of(context).size.width;
  var screenHeight=MediaQuery.of(context).size.height;
  var screenWidthGlobal=screenWidth/5;
  var screenHeightGlobal=screenHeight/7;
  return Scaffold(
    body: Center(
      child:Container(
        color:Colors.red,
        child: Column(
          children:[
            Container(
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
                   Container(
                    margin:EdgeInsets.all(5),
                    width:screenWidthGlobal,
                      height:screenHeightGlobal,
                      decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color:Color.fromARGB(115, 0, 0, 0),
                      ),
                      child:TextButton(
                      child:Text("1", style:style),
                        onPressed:(){   
                          setState((){
                          number="1";
                          firstNumber.add(number);
                        });
                        }
                    )
                    ),
                     Container(
                    margin:EdgeInsets.all(5),
                    width:screenWidthGlobal,
                      height:screenHeightGlobal,
                      decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color:Color.fromARGB(115, 0, 0, 0),
                      ),
                      child:TextButton(
                      child:Text("2", style:style),
                        onPressed:(){   
                          setState((){
                          number="2";
                          firstNumber.add(number);
                        });
                        }
                    )
                    ),
                    Container(
                    margin:EdgeInsets.all(5),
                    width:screenWidthGlobal,
                      height:screenHeightGlobal,
                      decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color:Color.fromARGB(115, 0, 0, 0),
                      ),
                      child:TextButton(
                      child:Text("3", style:style),
                        onPressed:(){   
                          setState((){
                          number="3";
                          firstNumber.add(number);
                        });
                        }
                    ),
                    )
                ]
              ),
              Row(
                  children: [
                   Container(
                    margin:EdgeInsets.all(5),
                    width:screenWidthGlobal,
                      height:screenHeightGlobal,
                      decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color:Color.fromARGB(115, 0, 0, 0),
                      ),
                      child:TextButton(
                      child:Text("4", style:style),
                        onPressed:(){   
                          setState((){
                          number="4";
                          firstNumber.add(number);
                        });
                        }
                    )
                    ),
                     Container(
                    margin:EdgeInsets.all(5),
                    width:screenWidthGlobal,
                      height:screenHeightGlobal,
                      decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color:Color.fromARGB(115, 0, 0, 0),
                      ),
                      child:TextButton(
                      child:Text("5", style:style),
                        onPressed:(){   
                          setState((){
                          number="5";
                          firstNumber.add(number);
                        });
                        }
                    )
                    ),
                    Container(
                    margin:EdgeInsets.all(5),
                    width:screenWidthGlobal,
                      height:screenHeightGlobal,
                      decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color:Color.fromARGB(115, 0, 0, 0),
                      ),
                      child:TextButton(
                      child:Text("6", style:style),
                        onPressed:(){   
                          setState((){
                          number="6";
                          firstNumber.add(number);
                        });
                        }
                    ),
                    )
                ]
              ),
              Row(
                  children: [
                   Container(
                    margin:EdgeInsets.all(5),
                    width:screenWidthGlobal,
                      height:screenHeightGlobal,
                      decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color:Color.fromARGB(115, 0, 0, 0),
                      ),
                      child:TextButton(
                      child:Text("7", style:style),
                        onPressed:(){   
                          setState((){
                          number="7";
                          firstNumber.add(number);
                        });
                        }
                    )
                    ),
                     Container(
                    margin:EdgeInsets.all(5),
                    width:screenWidthGlobal,
                      height:screenHeightGlobal,
                      decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color:Color.fromARGB(115, 0, 0, 0),
                      ),
                      child:TextButton(
                      child:Text("8", style:style),
                        onPressed:(){   
                          setState((){
                          number="8";
                          firstNumber.add(number);
                        });
                        }
                    )
                    ),
                    Container(
                    margin:EdgeInsets.all(5),
                    width:screenWidthGlobal,
                      height:screenHeightGlobal,
                      decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(20),
                      color:Color.fromARGB(115, 0, 0, 0),
                      ),
                      child:TextButton(
                      child:Text("9", style:style),
                        onPressed:(){   
                          setState((){
                          number="9";
                          firstNumber.add(number);
                        });
                        }
                    ),
                    )
                ]
              ),
              Row(
                children: [
                  Container(
                        margin:EdgeInsets.all(5),
                        width:screenWidthGlobal,
                          height:screenHeightGlobal,
                          decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(20),
                          color:Color.fromARGB(115, 0, 0, 0),
                          ),
                          child:TextButton(
                          child:Text("0", style:style),
                            onPressed:(){   
                              setState((){
                              number="0";
                              firstNumber.add(number);
                            });
                            }
                        ),
                        ),
                ],
              )
              
          ]
        )
      )
      ]
    )
    )
    )
  );
  }

}


