import 'package:crud_restfull/models/ProfileModel.dart';
import 'package:http/http.dart' show Client;

class ProfileService {
  final String baseUrl = "http://192.168.43.196:3000/profile";
  Client client = Client();
  ProfileModel profil = new ProfileModel();

  Future<List<ProfileModel>> showProfile() async {
    final response = await client.get("$baseUrl");

    if (response.statusCode == 200) {
      return profil.profileFromJson(response.body);
    } else {
      return null;
    }
  }

  // ambil data profil berdasarkan id
  Future<List<ProfileModel>> getProfile(int id) async {
    final response = await client.get("$baseUrl/$id");

    if (response.statusCode == 200) {
      return profil.profileFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createProfile(ProfileModel data) async {
    final response = await client.post(
      "$baseUrl",
      headers: {"content-type": "application/json"},
      body: profil.profileToJson(data),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProfile(ProfileModel data) async {
    final response = await client.put(
      "$baseUrl/${data.id}",
      headers: {"content-type": "application/json"},
      body: profil.profileToJson(data),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProfile(int id) async {
    final response = await client.delete(
      "$baseUrl/$id",
      headers: {"content-type": "application/json"},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
