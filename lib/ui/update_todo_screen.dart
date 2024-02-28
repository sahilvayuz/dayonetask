import 'package:flutter/material.dart';
import 'package:todo_task/hive_models/todo_hive_model.dart';

class UpdateTodoScreen extends StatefulWidget {

  const UpdateTodoScreen({super.key,required this.ind, required this.title, required this.description});

  final String title;
  final String description;


  
  final int ind;

  @override
  State<UpdateTodoScreen> createState() => UpdateTodoScreenState();
}

class UpdateTodoScreenState extends State<UpdateTodoScreen> {



TextEditingController textEditingController1= TextEditingController();
TextEditingController textEditingController2= TextEditingController();


@override
  void initState() {

    HiveManager.init();
    textEditingController1.text=widget.title;
    textEditingController2.text=widget.description;
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: Text("ToDo app"), actions: [IconButton(onPressed:(){ listOfAllTodo();   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListOfAllTodo()));} , icon:Icon( Icons.note))],),
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
          //sujay
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
          
          ElevatedButton(onPressed: (){updateTodo(textEditingController1.text, textEditingController2.text, widget.ind, context); Navigator.pop(context);}, child: Text("Update todo")),
          ],)),
      )
      );
  }
}