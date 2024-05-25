import 'package:http/http.dart' as http;
import 'dart:convert';

import 'constants.dart';

class ApiService {
  Future<Map<String, dynamic>> requestLogin(
      String username, String password) async {
    // print(Constants.loginEndpoint);
    final response = await http.post(
      Uri.parse(Constants.loginEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "jsonrpc": "2.0",
        "params": {
          'username': username,
          'password': password,
        }
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  // General POST request
  Future<Map<String, dynamic>> requestPost(Map<String, dynamic> data,
      {String endpoint = Constants.loginEndpoint,
      Map<String, String>? additionalHeaders}) async {
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }

    final response = await http.post(
      Uri.parse(endpoint),
      headers: headers,
      body: jsonEncode({"jsonrpc":"2.0","params":data}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to fetch data. Status code: ${response.statusCode}');
    }
  }
}
