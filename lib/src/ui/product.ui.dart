import 'package:flutter/material.dart';

class ProductUI extends StatefulWidget {
  const ProductUI({Key key}) : super(key: key);

  @override
  _ProductUIState createState() => _ProductUIState();
}

class _ProductUIState extends State<ProductUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
      ),
    );
  }
}
