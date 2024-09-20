import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_users_manager/data/dummY_users.dart';
import 'package:flutter_users_manager/models/user.dart';

class Users with ChangeNotifier{
  Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all{
    return [..._items.values];
  }

  int get count{
    return _items.length;
  }

  User byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(User user){
    if(user == null){
      return;
    }

    if(user.id!.isNotEmpty && _items.containsKey(user.id)){
      _items.update(
        user.id!, 
        (_) => User(
          id: user.id,
          name: user.name,
          email: user.email,
          phone: user.phone,
        ),
      );
    }else{
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id, 
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          phone: user.phone,  
        ),
      );
    }

    
    notifyListeners();
  }

  void remove(User user){
    if(user != null && user.id != null){
      _items.remove(user.id);
      notifyListeners();
    }
  }

   
}