import 'package:flutter/material.dart';
import 'package:todo_task/hive_models/todo_hive_model.dart';
import 'package:todo_task/models/todo_models.dart';
import 'package:todo_task/ui/update_todo_screen.dart';
import 'package:todo_task/ui/whole_description.dart';
import 'package:todo_task/veriabls/list_of_hive_todo.dart';
import 'package:todo_task/veriabls/list_of_todo.dart';

class ListOfAllTodo extends StatefulWidget {
  const ListOfAllTodo({super.key});

  @override
  State<ListOfAllTodo> createState() => _ListOfAllTodoState();
}

class _ListOfAllTodoState extends State<ListOfAllTodo> {

//List<TodoModels> listOfTodos=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: todoooss!.length,
        itemBuilder: (BuildContext context, int index) { 


          return ListTile(
            title: Text("${todoooss![index].title}"),
            subtitle: Text("${todoooss![index].description}"),
            trailing:   Wrap(children:[
               IconButton(onPressed: () {deleteTodo(index); Navigator.pop(context);}, icon: Icon(Icons.delete)),  
               IconButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) =>UpdateTodoScreen(title: todoooss![index].title!, description: todoooss![index].description!, ind: index))); } ,icon: Icon(Icons.edit))]),
               onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) =>WholeDescriptionOfTodo(title: todoooss![index].title!, description: todoooss![index].description!)));
               },

          );


          // return GridView(
          //    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //        crossAxisCount: 2, 
          //        crossAxisSpacing: 10.0, 
          //        mainAxisSpacing: 10.0,  ),

          //   );



         },
        
      ),
    );
  }


  @override
  void dispose() {
    todoooss.clear();
    // TODO: implement dispose
    super.dispose();
  }
}