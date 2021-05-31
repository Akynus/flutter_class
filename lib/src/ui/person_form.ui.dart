import 'package:aula_flutter/src/model/person.dart';
import 'package:aula_flutter/src/respository/person.repository.dart';
import 'package:flutter/material.dart';

class PersonFormUI extends StatefulWidget {
  const PersonFormUI({Key key}) : super(key: key);

  @override
  _PersonFormUIState createState() => _PersonFormUIState();
}

class _PersonFormUIState extends State<PersonFormUI> {
  final _formKey = GlobalKey<FormState>();
  Person person = new Person();

  @override
  void initState() {
    super.initState();
  }

  void onSubmit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(person.name);
      final repository = new PersonRepository();
      await repository.insert(person);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário de Pessoa"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome'),
              onSaved: (newValue) => person.name = newValue,
              validator: (value) {
                if (value.isEmpty) return "Campo Obrigatório";
                return null;
              },
            ),
            Container(height: 20),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              decoration: InputDecoration(labelText: 'Endereço'),
              onSaved: (newValue) => person.address = newValue,
              validator: (value) {
                if (value.isEmpty) return "Campo Obrigatório";
                return null;
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: onSubmit,
        label: Text('Salvar'),
      ),
    );
  }
}
