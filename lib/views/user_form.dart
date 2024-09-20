import 'package:flutter/material.dart';
import 'package:flutter_users_manager/models/user.dart';
import 'package:flutter_users_manager/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void laodFormData(User user){
    if(user != null){
      _formData['id'] = user.id!;
      _formData['name'] = user.name!;
      _formData['email'] = user.email!;
      _formData['phone'] = user.phone!;
    }
  }

  @override
  Widget build(BuildContext context){
    if(ModalRoute.of(context)!.settings.arguments != null){
      final User user = ModalRoute.of(context)!.settings.arguments as User;
      laodFormData(user);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
        backgroundColor: Color.fromARGB(255, 189, 188, 188),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            color: Colors.black,
            onPressed: (){
              final isValid = _form.currentState!.validate();
              if(isValid){
                _form.currentState!.save();
                Provider.of<Users>(context, listen: false).put(User(
                  id: _formData['id'] ?? '',
                  name: _formData['name'] ?? '',
                  email: _formData['email'] ?? '',
                  phone: _formData['phone'] ?? '',
                ));
                Navigator.of(context).pop();
              }

            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
        key: _form,
        child: Column(
          children: <Widget>[
            TextFormField(
              initialValue: _formData['name'],
              decoration: InputDecoration(labelText: 'Nome'),
              onSaved: (value) => _formData['name'] = value!,
              validator: (value){
                if(value == null || value.trim().isEmpty){
                  return 'Nome inválido';
                }

                if(value.trim().length <= 3){
                  return 'Nome muito pequeno. No mínimo 3 letras';
                }
              }
            ),
            TextFormField(
              initialValue: _formData['email'],
              decoration: InputDecoration(labelText: 'E-mail'),
              onSaved: (value) => _formData['email'] = value!,
            ),
            TextFormField(
              initialValue: _formData['phone'],
              decoration: InputDecoration(labelText: 'Telefone'),
              onSaved: (value) => _formData['phone'] = value!,
            ),
          ],
        ),
      )),
      );
  }
}