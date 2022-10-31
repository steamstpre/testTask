import 'package:http/http.dart' as http;
import 'package:test_app/models/user_model.dart';

class API {
  final _client = http.Client();

  Future<List<UserModel>?> getData() async {
    var uriResponse = await _client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    try {
      if (uriResponse.statusCode == 200) {
        var resultJson = uriResponse.body;
        return postFromJson(resultJson);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  void closeClient() => _client.close();
}
