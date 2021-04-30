import 'package:flutter/material.dart';
import 'package:crud_restfull/views/Login.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD SIMPLE',
      home: Login(),
    );
  }
}
