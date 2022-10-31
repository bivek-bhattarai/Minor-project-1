import 'package:http/http.dart' as http;
import 'dart:convert';


class Helper {

  String url = 'https://62b7f6b5f4cb8d63df56ee35.mockapi.io/api/v1/user';

  Future<void> addUser(
      String newUserName,
      ) async {
    await http
        .post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': newUserName,
      }),
    )
        .then((value) =>
    {
      print('Add Process complete'),
      print(value.statusCode),
    });
  }

}