import 'package:aula_flutter/src/model/user.dart';
import 'package:aula_flutter/src/ui/home.ui.dart';
import 'package:flutter/material.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({Key key}) : super(key: key);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final _formKey = GlobalKey<FormState>();
  final user = new User();

  void submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      print([user.nickname, user.password]);

      if (user.nickname == "user" && user.password == "123") {
        Navigator.of(context).pushNamed("/home");
      } else {
        _formKey.currentState.reset();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Usuário ou Senha invalidos'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Usuário',
                        hintText: 'Digite o usuário'),
                    onSaved: (newValue) {
                      user.nickname = newValue;
                    },
                    validator: (value) {
                      if (value.isEmpty) return "Campo obrigatorio";
                      return null;
                    },
                  ),
                  Container(height: 20),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        labelText: 'Senha',
                        hintText: 'Digite a senha'),
                    onSaved: (newValue) {
                      user.password = newValue;
                    },
                    validator: (value) {
                      if (value.isEmpty) return "Campo obrigatorio";
                      return null;
                    },
                  ),
                  Container(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: submit,
                      child: Text('Entrar'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
