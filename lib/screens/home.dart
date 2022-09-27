import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState()=> _HomeScreen();
}



class _HomeScreen extends State<HomeScreen>{
  
  @override
  Widget build(BuildContext context){
  var screenWidth=MediaQuery.of(context).size.width;
  var screenHeight=MediaQuery.of(context).size.height;
  return Scaffold(
    body: Center(
      child:Container(
        width: screenWidth,
        height:screenHeight/3,
        child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4
              ),
              itemCount:10,
              itemBuilder:((context, index) {
                return Container(
                  child:Text(index.toString())
                );
              })
            ),
      )
      )
    );
  }

}


