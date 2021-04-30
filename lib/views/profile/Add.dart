import 'package:crud_restfull/service/ProfileService.dart';
import 'package:flutter/material.dart';
import 'package:crud_restfull/models/ProfileModel.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddProfil extends StatefulWidget {
  @override
  _AddProfilState createState() => _AddProfilState();
}

class _AddProfilState extends State<AddProfil> {
  bool _isLoading = false;
  bool _isFieldNameValid;
  bool _isFieldEmailValid;
  bool _isFieldAgeValid;

  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerAge = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text("Tambahkan Profil"),
      ),
      body: _isLoading
          ? Stack(
              children: <Widget>[
                Opacity(
                  opacity: 0.3,
                  child: ModalBarrier(
                    dismissible: false,
                    color: Colors.grey,
                  ),
                ),
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Ini halaman tambahkan profil",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                    _buildTextFieldName(),
                    _buildTextFieldEmail(),
                    _buildTextFieldAge(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: RaisedButton(
                        onPressed: () {
                          if (_isFieldNameValid == null ||
                              _isFieldEmailValid == null ||
                              _isFieldAgeValid == null ||
                              !_isFieldNameValid ||
                              !_isFieldEmailValid ||
                              !_isFieldAgeValid) {
                            _scaffoldState.currentState.showSnackBar(
                              SnackBar(
                                content: Text("Please fill all field"),
                              ),
                            );
                            return;
                          }

                          setState(() => _isLoading = true);
                          String name = _controllerName.text.toString();
                          String email = _controllerEmail.text.toString();
                          int age = int.parse(_controllerAge.text.toString());

                          ProfileModel profil =
                              ProfileModel(name: name, email: email, age: age);

                          ProfileService()
                              .createProfile(profil)
                              .then((isSuccess) {
                            setState(() => _isLoading = false);

                            if (isSuccess) {
                              Navigator.pop(
                                  _scaffoldState.currentState.context);
                            } else {
                              _scaffoldState.currentState.showSnackBar(SnackBar(
                                content: Text("Submit data failed"),
                              ));
                            }
                          });
                        },
                        child: Text(
                          "Submit".toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildTextFieldName() {
    return TextField(
      controller: _controllerName,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Full name",
        errorText: _isFieldNameValid == null || _isFieldNameValid
            ? null
            : "Full name is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNameValid) {
          setState(() => _isFieldNameValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldEmail() {
    return TextField(
      controller: _controllerEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        errorText: _isFieldEmailValid == null || _isFieldEmailValid
            ? null
            : "Email is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldEmailValid) {
          setState(() => _isFieldEmailValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldAge() {
    return TextField(
      controller: _controllerAge,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Age",
        errorText: _isFieldAgeValid == null || _isFieldAgeValid
            ? null
            : "Age is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldAgeValid) {
          setState(() => _isFieldAgeValid = isFieldValid);
        }
      },
    );
  }
}
