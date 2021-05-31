import 'package:aula_flutter/src/model/person.dart';
import 'package:aula_flutter/src/resource/db.connection.dart';
import 'package:sqflite/sqflite.dart';

class PersonRepository {
  Database _instance;

  PersonRepository() : _instance = DbConnection.instance;

  Future<int> insert(Person person) {
    return _instance.rawInsert(
      "INSERT INTO person (name, address) VALUES (?, ?)",
      [person.name, person.address],
    );
  }

  Future<int> update(Person person) {
    return _instance.rawUpdate(
      "UPDATE person SET name = ?, address = ? WHERE id = ?",
      [person.name, person.address, person.id],
    );
  }

  Future<int> delete(int id) {
    return _instance.rawDelete("DELETE FROM person WHERE id = ?", [id]);
  }

  Future<List<Person>> list() async {
    List<Map<String, Object>> data =
        await _instance.rawQuery("SELECT * FROM person");

    return data.map((e) {
      return Person(id: e['id'], name: e['name'], address: e['address']);
    }).toList();
  }
}
