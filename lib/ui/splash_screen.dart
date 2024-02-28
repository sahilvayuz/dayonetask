import 'dart:js';

import 'package:flutter/material.dart';
import 'package:todo_task/ui/home_screen.dart';

class SplasshScreen extends StatefulWidget {
  const SplasshScreen({super.key});

  @override
  State<SplasshScreen> createState() => _SplasshScreenState();
}

class _SplasshScreenState extends State<SplasshScreen> {

   @override
  void initState() {
    // TODO: implement initState
   Future.delayed(Duration(seconds: 3));
 //  Navigator.push(context, MaterialPageRoute(builder: context()=> MyHomeScreenState() ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Text("ToDo App",textAlign: TextAlign.center,style: TextStyle(fontSize: 25),),))
      );
  }



}