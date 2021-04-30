import 'dart:convert';

class ProfileModel {
  int id;
  String name;
  String email;
  int age;

  ProfileModel({this.id = 0, this.name, this.email, this.age});

  factory ProfileModel.fromJson(Map<String, dynamic> map) {
    return ProfileModel(
      id: map["id"],
      name: map["name"],
      email: map["email"],
      age: map["age"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email, "age": age};
  }

  @override
  String toString() {
    return 'Profile{id: $id, name: $name, email: $email, age: $age}';
  }

  List<ProfileModel> profileFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<ProfileModel>.from(
        data.map((item) => ProfileModel.fromJson(item)));
  }

  String profileToJson(ProfileModel data) {
    final jsonData = data.toJson();
    return json.encode(jsonData);
  }
}
