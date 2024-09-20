import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_todolist_manager/data/dummY_users.dart';
import 'package:flutter_todolist_manager/models/todo.dart';

class Todolist with ChangeNotifier{
  Map<String, Todo> _items = {...DUMMY_todolist};

  List<Todo> get all{
    return [..._items.values];
  }

  int get count{
    return _items.length;
  }

  Todo byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(Todo todo){
    if(todo == null){
      return;
    }

    if(todo.id!.isNotEmpty && _items.containsKey(todo.id)){
      _items.update(
        todo.id!, 
        (_) => Todo(
          id: todo.id,
          titulo: todo.titulo,
          description: todo.description,
        ),
      );
    }else{
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id, 
        () => Todo(
          id: id,
          titulo: todo.titulo,
          description: todo.description,
        ),
      );
    }

    
    notifyListeners();
  }

  void remove(Todo todo){
    if(todo != null && todo.id != null){
      _items.remove(todo.id);
      notifyListeners();
    }
  }

   
}