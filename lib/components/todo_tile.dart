import 'package:flutter/material.dart';
import 'package:flutter_users_manager/models/todo.dart';
import 'package:flutter_users_manager/provider/todo_list.dart';
import 'package:provider/provider.dart';

class TodoTile extends StatelessWidget{
  final Todo todo;

  const TodoTile(this.todo);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.titulo),
      subtitle: Text(todo.description),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.blue,
            onPressed: (){
              Navigator.of(context).pushNamed(
                '/user-form',
                arguments: todo,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.red,
            onPressed: (){
              Provider.of<Todolist>(context, listen: false).remove(todo);
            },
          ),
        ],
        ),
    );
  }
}