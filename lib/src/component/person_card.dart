import 'package:aula_flutter/src/model/person.dart';
import 'package:flutter/material.dart';

enum _PopupAction { edit, delete }

class PersonCard extends StatelessWidget {
  final Person person;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PersonCard({
    Key key,
    @required this.person,
    @required this.onEdit,
    @required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(person.name),
        subtitle: Text(person.address),
        trailing: PopupMenuButton<_PopupAction>(
          onSelected: (value) {
            switch (value) {
              case _PopupAction.edit:
                {
                  onEdit();
                  break;
                }
              case _PopupAction.delete:
                {
                  onDelete();
                  break;
                }
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: _PopupAction.edit,
              child: ListTile(
                leading: Icon(Icons.edit),
                title: Text("Editar"),
              ),
            ),
            PopupMenuItem(
              value: _PopupAction.delete,
              child: ListTile(
                leading: Icon(Icons.delete),
                title: Text("Excluir"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
