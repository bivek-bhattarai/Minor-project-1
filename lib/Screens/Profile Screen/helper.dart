import 'dart:convert';

import 'package:http/http.dart' as http;

class Helper {

  String url = 'https://62b7f6b5f4cb8d63df56ee35.mockapi.io/api/v1/user';

  Future<void> deleteData(String id) async {
    await http.delete(Uri.parse('$url/$id'));
  }

  Future<void> updateData(String id, String updatedName) async {

    await http.put(
      Uri.parse('$url/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': updatedName,
      }),
    ).then((value) => print('Process complete'));
  }

}