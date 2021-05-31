import 'package:aula_flutter/src/ui/home.ui.dart';
import 'package:aula_flutter/src/ui/login.ui.dart';
import 'package:aula_flutter/src/ui/person.ui.dart';
import 'package:aula_flutter/src/ui/person_form.ui.dart';
import 'package:aula_flutter/src/ui/product.ui.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula Flutter',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      initialRoute: "/home",
      routes: {
        '/login': (context) => LoginUI(),
        '/home': (context) => HomeUI(),
        '/person': (context) => PersonUI(),
        '/product': (context) => ProductUI(),
        '/person/form':(context) => PersonFormUI()
      },
    );
  }
}
