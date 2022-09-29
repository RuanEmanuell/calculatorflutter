import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/number.dart';


Future<void> main() async {

  runApp(MaterialApp(
    initialRoute:"/home",
    routes:{
      "/home":(context)=>HomeScreen(),
      "/number":(context)=>NumberScreen()
    }
  ));
}

