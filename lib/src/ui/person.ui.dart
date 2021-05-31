import 'package:aula_flutter/src/component/person_card.dart';
import 'package:aula_flutter/src/model/person.dart';
import 'package:aula_flutter/src/respository/person.repository.dart';
import 'package:flutter/material.dart';

class PersonUI extends StatefulWidget {
  const PersonUI({Key key}) : super(key: key);

  @override
  _PersonUIState createState() => _PersonUIState();
}

class _PersonUIState extends State<PersonUI> {
  List<Person> _data = [];

  @override
  void initState() {
    refreshData();
    super.initState();
  }

  void refreshData() {
    final repository = new PersonRepository();
    repository.list().then((value) {
      setState(() {
        _data = value;
      });
    });
  }

  void insertPerson() async {
    await Navigator.pushNamed(context, "/person/form");
    refreshData();
  }

  void editPerson(Person person) {}

  void deletePerson(Person person) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Excluir pessoa"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text("Excluir"),
            )
          ],
        );
      },
    );

    if (result) {
      final repository = PersonRepository();
      await repository.delete(person.id);
      refreshData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pessoas'),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          final person = _data[index];
          return PersonCard(
            person: person,
            onDelete: () => deletePerson(person),
            onEdit: () => editPerson(person),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: insertPerson,
        icon: Icon(Icons.add),
        label: Text("Inserir"),
      ),
    );
  }
}
