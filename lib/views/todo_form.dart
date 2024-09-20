import 'package:flutter/material.dart';
import 'package:flutter_users_manager/models/todo.dart';
import 'package:flutter_users_manager/provider/todo_list.dart';
import 'package:provider/provider.dart';

class TodoForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void laodFormData(Todo todo){
    if(todo != null){
      _formData['id'] = todo.id!;
      _formData['titulo'] = todo.titulo;
      _formData['description'] = todo.description;
    }
  }

  @override
  Widget build(BuildContext context){
    if(ModalRoute.of(context)!.settings.arguments != null){
      final Todo todo = ModalRoute.of(context)!.settings.arguments as Todo;
      laodFormData(todo);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de tarefa'),
        backgroundColor: Color.fromARGB(255, 189, 188, 188),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            color: Colors.black,
            onPressed: (){
              final isValid = _form.currentState!.validate();
              if(isValid){
                _form.currentState!.save();
                Provider.of<Todolist>(context, listen: false).put(Todo(
                  id: _formData['id'] ?? '',
                  titulo: _formData['titulo']!,
                  description: _formData['description']!,
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
              initialValue: _formData['titulo'],
              decoration: InputDecoration(labelText: 'Titulo'),
              onSaved: (value) => _formData['titulo'] = value!,
              validator: (value){
                if(value == null || value.trim().isEmpty){
                  return 'título inválido';
                }

                if(value.trim().length <= 3){
                  return 'título muito pequeno. No mínimo 3 letras';
                }
              }
            ),
            TextFormField(
              initialValue: _formData['description'],
              decoration: InputDecoration(labelText: 'Descrição'),
              onSaved: (value) => _formData['description'] = value!,
            ),
          ],
        ),
      )),
      );
  }
}