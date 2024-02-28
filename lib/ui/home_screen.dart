
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_task/hive_models/todo_hive_model.dart';
import 'package:todo_task/models/todo_models.dart';
import 'package:todo_task/ui/list_of_all_todo.dart';
import 'package:todo_task/veriabls/list_of_hive_todo.dart';
import 'package:todo_task/veriabls/list_of_todo.dart';

class MyHomeScreenState extends StatefulWidget {
  const MyHomeScreenState({super.key});

  @override
  State<MyHomeScreenState> createState() => MyHomeScreenStateState();
}

class MyHomeScreenStateState extends State<MyHomeScreenState> {


TextEditingController textEditingController1= TextEditingController();
TextEditingController textEditingController2= TextEditingController();


@override
  void initState() {

    HiveManager.init();
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ToDo app"), actions: [IconButton(onPressed:(){ listOfAllTodo();   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListOfAllTodo()));} , icon:Icon( Icons.note))],),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
           TextField(
            style: TextStyle(fontFamily: 'Poppins', color: Colors.black),
          //  obscureText: obscureText,
            controller: textEditingController1,
            decoration: InputDecoration(
           //   icon: Icon(Icons.person, color: Colors.grey),
              labelText: 'title',
              hintText: 'title',
              //   prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
            ),
          ),
            SizedBox(height: 20,),
        
        
        
             TextField(
            style: TextStyle(fontFamily: 'Poppins', color: Colors.black),
          //  obscureText: obscureText,
            controller: textEditingController2,
            decoration: InputDecoration(
           //   icon: Icon(Icons.person, color: Colors.grey),
              labelText: 'description',
              hintText: 'description',
              //   prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
            ),
          ),
        
        
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){addTodo(textEditingController1.text, textEditingController2.text);listOfTodos.add(TodoModels(title: textEditingController1.text.toString(), description: textEditingController2.text.toString())); log("$allData $todoooss}");}, child: Text("add")),
        
          ],)),
      )
      );
  }
}