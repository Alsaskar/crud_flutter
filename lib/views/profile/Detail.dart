import 'package:flutter/material.dart';

class DetailProfile extends StatefulWidget {
  String name, email;
  int age;

  DetailProfile({this.name, this.email, this.age, Key key}) : super(key: key);

  @override
  _DetailProfileState createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil User"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Ini halaman detail user",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                widget.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                widget.email,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "Umur " + widget.age.toString() + " tahun",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
