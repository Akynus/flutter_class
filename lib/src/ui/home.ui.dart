import 'package:flutter/material.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key key}) : super(key: key);

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  void goPath(String path) {
    Navigator.of(context).pushNamed(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: showDrawer,
          icon: Icon(Icons.menu),
        ),
        title: Text('Pagina Inicial'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/drawer_header.jpg"),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.group),
              onTap: () => goPath("/person"),
              title: Text('Pessoas'),
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              onTap: () => goPath("/product"),
              title: Text('Produtos'),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Text('Home Page'),
      ),
    );
  }
}
