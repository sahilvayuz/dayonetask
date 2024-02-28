import 'package:flutter/material.dart';

class WholeDescriptionOfTodo extends StatefulWidget {
  const WholeDescriptionOfTodo({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  State<WholeDescriptionOfTodo> createState() => _WholeDescriptionOfTodoState();
}

class _WholeDescriptionOfTodoState extends State<WholeDescriptionOfTodo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: MediaQuery.of(context).size.height *1,
              width: MediaQuery.of(context).size.width *1,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("${widget.title}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
                SizedBox(height: 10,),
                Text("${widget.description}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                ]),
            ),
          ),
        ),
      );
  }
}