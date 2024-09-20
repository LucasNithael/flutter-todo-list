import 'package:flutter/material.dart';
import 'package:flutter_users_manager/components/user_tile.dart';
import 'package:flutter_users_manager/data/dummY_users.dart';
import 'package:flutter_users_manager/models/user.dart';
import 'package:flutter_users_manager/provider/users.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
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
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
}}