import 'package:flutter/material.dart';
import 'package:flutter_users_manager/components/todo_tile.dart';
import 'package:flutter_users_manager/data/dummY_users.dart';
import 'package:flutter_users_manager/models/todo.dart';
import 'package:flutter_users_manager/provider/todo_list.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Todolist users = Provider.of(context);

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
        itemCount: users.count,
        itemBuilder: (ctx, i) => TodoTile(users.byIndex(i)),
      ),
    );
}}