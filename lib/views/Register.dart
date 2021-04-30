import 'package:flutter/material.dart';
import 'package:crud_restfull/views/Login.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();
  TextEditingController _controllerConfirmPass = TextEditingController();

  bool _isLoading = false;
  bool _isFieldEmailValid;
  bool _isFieldPassValid;
  bool _isFieldConfirmPassValid;

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
                "assets/images/register.png",
                height: 200,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "Daftar Sekarang",
                  style: TextStyle(fontSize: 25),
                ),
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
                padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                child: _buildTextFieldCofirmPass(),
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
                      "Register",
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
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: Text("Sudah punya akun ? Login"),
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
        prefixIcon: Icon(Icons.email),
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
        if (isFieldValid != _isFieldEmailValid) {
          setState(() => _isFieldEmailValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldPass() {
    return TextField(
      controller: _controllerPass,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
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

  Widget _buildTextFieldCofirmPass() {
    return TextField(
      controller: _controllerPass,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
        labelText: "Konfirmasi Password",
        errorText: _isFieldConfirmPassValid == null || _isFieldConfirmPassValid
            ? null
            : "Konfirmasi Password tidak boleh kosong",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldConfirmPassValid) {
          setState(() => _isFieldConfirmPassValid = isFieldValid);
        }
      },
    );
  }
}
