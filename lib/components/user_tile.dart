import 'package:flutter/material.dart';
import 'package:flutter_users_manager/models/user.dart';
import 'package:flutter_users_manager/provider/users.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget{
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.blue,
            onPressed: (){
              Navigator.of(context).pushNamed(
                '/user-form',
                arguments: user,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.red,
            onPressed: (){
              Provider.of<Users>(context, listen: false).remove(user);
            },
          ),
        ],
        ),
    );
  }
}