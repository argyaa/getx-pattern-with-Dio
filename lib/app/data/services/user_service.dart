import 'package:dio/dio.dart';
import 'package:first_get_cli/app/data/models/user_model.dart';

class UserService {
  Future<List<User>> getUser() async {
    try {
      var response = await Dio().get('https://reqres.in/api/users');
      List _data = response.data["data"];
      List<User> listUser = _data.map((e) => User.fromJson(e)).toList();
      return listUser;
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }
}
