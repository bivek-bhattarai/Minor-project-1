import 'package:http/http.dart' as http;
import 'dart:convert';

class Helper {
  String url = 'https://62b7f6b5f4cb8d63df56ee35.mockapi.io/api/v1/user';

  Future<List> getData() async {
    late List userData = [];
    await http.get(Uri.parse(url)).then(
          (value) => userData = jsonDecode(value.body),
        );
    return userData;
  }

}
