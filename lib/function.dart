import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

fetchData(String url, Map<String, Object?> body, String? method) async {
  try {
    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    if (method == 'POST') {
      Uri uri = Uri.parse(url);
      final response =
          await http.post(uri, headers: header, body: jsonEncode(body));
      var data = jsonDecode(response.body)["data"];
      return data;
    } else if (method == 'GET') {
      Uri uri = Uri.parse(url);
      final newURI = uri.replace(queryParameters: body);
      final response = await http.get(newURI, headers: header);
      var data = jsonDecode(response.body)["data"];
      return data;
    }

    // Uri uri = Uri.parse(url);
    // final newURI = uri.replace(queryParameters: body);
    // final header = <String, String>{
    //   'Content-Type': 'application/json; charset=UTF-8',
    // };
    // final response = await http.post(newURI, headers: header, body: body);

    // var data = jsonEncode({
    //   'classname': className,
    //   'subjectname': subName,
    // });
    // final response = await http.post(Uri.parse(url), body: data,  headers: <String, String>{
    //   'Content-Type': 'application/json; charset=UTF-8',
    // },);

  } catch (error) {
    return error;
  }
}
