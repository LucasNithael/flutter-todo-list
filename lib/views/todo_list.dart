import 'package:flutter/material.dart';
import 'package:flutter_todolist_manager/components/todo_tile.dart';
import 'package:flutter_todolist_manager/data/dummY_todolist.dart';
import 'package:flutter_todolist_manager/models/todo.dart';
import 'package:flutter_todolist_manager/provider/todo_list.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Todolist todolist = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tarefas'),
        backgroundColor: Color.fromARGB(255, 189, 188, 188),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            color: Colors.black,
            onPressed: (){
              Navigator.of(context).pushNamed('/user-form');
            },
          ),
        ],
      ),
      body:  ListView.builder(
        itemCount: todolist.count,
        itemBuilder: (ctx, i) => TodoTile(todolist.byIndex(i)),
      ),
    );
}}