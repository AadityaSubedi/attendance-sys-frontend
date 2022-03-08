import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';

fetchData(String url,
    {Map<String, Object?>? body, String? method, String? token}) async {
  try {
    var response;
    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
    if (method == 'POST') {
      Uri uri = Uri.parse(url);
      response = await http.post(uri, headers: header, body: jsonEncode(body));
    } else if (method == 'GET') {
      Uri uri = Uri.parse(url);
      final newURI = uri.replace(queryParameters: body);
      response = await http.get(newURI, headers: header);
    }
    if (response.statusCode != 200) {
      throw jsonDecode(response.body)["message"];
    }
    var data = jsonDecode(response.body)["data"];
    return data;
  } catch (error) {
    return error;
  }
}
