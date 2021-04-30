import 'package:flutter/material.dart';
import 'package:crud_restfull/views/Register.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();

  bool _isLoading = false;
  bool _isFieldEmailValid;
  bool _isFieldPassValid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: 150),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                height: 200,
              ),
              Text(
                "Login Dashboard Admin",
                style: TextStyle(fontSize: 25),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                child: _buildTextFieldEmail(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                child: _buildTextFieldPass(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ButtonTheme(
                  minWidth: 280.0,
                  height: 50.0,
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      print("Ini so berhasil di klik");
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ),
                    );
                  },
                  child: Text("Belum Daftar ? Silahkan daftar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldEmail() {
    return TextField(
      controller: _controllerEmail,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        labelText: "Email",
        errorText: _isFieldEmailValid == null || _isFieldEmailValid
            ? null
            : "Email tidak boleh kosong",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldPassValid) {
          setState(() => _isFieldPassValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldPass() {
    return TextField(
      controller: _controllerPass,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Password",
        errorText: _isFieldPassValid == null || _isFieldPassValid
            ? null
            : "Password tidak boleh kosong",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldPassValid) {
          setState(() => _isFieldPassValid = isFieldValid);
        }
      },
    );
  }
}
