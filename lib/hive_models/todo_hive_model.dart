import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_task/models/todo_models.dart';
import 'package:todo_task/veriabls/list_of_hive_todo.dart';
import 'package:todo_task/veriabls/open_box.dart';
part 'todo_hive_model.g.dart';


@HiveType(typeId: 0)
class Todo extends HiveObject {

  @HiveField(0)
  String? title;

  @HiveField(1)
  String? description;
}




class HiveManager {
  static late Box<Todo> _todoBox;

  static Future<void> init() async {
    // Open the box only once
    _todoBox = await Hive.openBox('myBox');
  }

  static Box<Todo> get todoBox => _todoBox;
}




// adding todos 

Future<void> addTodo(String title,String description) async{

//var box = await Hive.openBox('myBox');
 

 var todoVeriable = Todo()
  ..title = '$title'
  ..description = "$description";


 await HiveManager.todoBox.add(todoVeriable); 



}





//getting list of todos

Future<List<Todo>> listOfAllTodo() async {

//var box = await Hive.openBox('myBox');


for (var i = 0; i < HiveManager.todoBox.length; i++) {
    var todo = HiveManager.todoBox.getAt(i);
    if (todo is Todo) {
      todoooss.add(todo);
      log("titllllllleeeeeeessssssss ${todo.title}");
    } else {
      // Handle case where data in box is not of type Todo
      print('Data at index $i is not a Todo object');
    }
  }




  return todoooss;
}




Future<void> deleteTodo(int index) async {
  log("deleted items indexxxxxxx $index");

 // var box = await Hive.openBox<Todo>('myBox');
  var deleted= await HiveManager.todoBox.deleteAt(index); // Delete item at the specified index



}





//update todo


Future<void> updateTodo(String title, String description, int ind,BuildContext context) async {
  
  // Check if the index is valid
  if (ind >= 0 && ind < HiveManager.todoBox.length) {
    // Retrieve the Todo object at the given index
    Todo? todoToUpdate = HiveManager.todoBox.getAt(ind);

    if (todoToUpdate != null) {
      // Create a new Todo instance with updated values
      Todo updatedTodo = Todo()
        ..title = title
        ..description = description;

      // Put the updated Todo object back into the box at the same index
      await HiveManager.todoBox.putAt(ind, updatedTodo);
    } else {
      print('Todo object at index $ind does not exist.');
      Navigator.pop(context);
    }
  } else {
    print('Index $ind is out of range.');
     Navigator.pop(context);
  }


}