import 'package:flutter/material.dart';
import 'package:crud_restfull/service/ProfileService.dart';
import 'package:crud_restfull/models/ProfileModel.dart';
import 'package:crud_restfull/views/profile/Add.dart';
import 'package:crud_restfull/views/profile/Edit.dart';
import 'package:crud_restfull/views/profile/Detail.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Training Restfull API"),
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddProfil()),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
      body: FutureBuilder(
        future: ProfileService().showProfile(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ProfileModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<ProfileModel> profiles = snapshot.data;
            return _buildListView(profiles);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildListView(List<ProfileModel> profiles) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          ProfileModel profile = profiles[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      profile.name,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text("Email : " + profile.email),
                    Text("Umur : " + profile.age.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Warning"),
                                  content: Text(
                                      "Are you sure want to delete data profile ${profile.name}?"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Yes"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        ProfileService()
                                            .deleteProfile(profile.id)
                                            .then((isSuccess) {
                                          if (isSuccess) {
                                            setState(() {});
                                            Scaffold.of(this.context)
                                                .showSnackBar(
                                              SnackBar(
                                                content:
                                                    Text("Delete data success"),
                                              ),
                                            );
                                          } else {
                                            Scaffold.of(this.context)
                                                .showSnackBar(
                                              SnackBar(
                                                content:
                                                    Text("Delete data failed"),
                                              ),
                                            );
                                          }
                                        });
                                      },
                                    ),
                                    FlatButton(
                                      child: Text("No"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfil(
                                  idProfil: profile.id,
                                  name: profile.name,
                                  email: profile.email,
                                  age: profile.age,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Edit",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailProfile(
                                  name: profile.name,
                                  email: profile.email,
                                  age: profile.age,
                                ),
                              ),
                            );
                          },
                          child: Text("Detail"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: profiles.length,
      ),
    );
  }
}
