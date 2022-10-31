import 'package:test_app/models/user_model.dart';
import 'package:test_app/services/API/API.dart';

class Repository {
  List<UserModel>? _users;

  List<UserModel> get users => _users!;

  Future<List<String>?> getUsersTitleList() async {
    final api = API();
    List<String> res = [];
    _users = await api.getData();
    _users?.forEach((element) {
      res.add(element.title);
    });
    api.closeClient();
    return res;
  }

  UserModel getUserByIndex(int index) {
    return _users![index];
  }
}
