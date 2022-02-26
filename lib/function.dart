import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

fetchData(
    String url, String? className, String? subName, String? method) async {
  try {
    print('###################');
    final body = {
      'classname': className,
      'subjectname': subName,
    };
    if (method == 'POST') {
      Uri uri = Uri.parse(url);
      final header = <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response =
          await http.post(uri, headers: header, body: jsonEncode(body));
      print(response.body);
      return response.body;
    } else if (method == 'GET') {
      print('Boom Boom');
      Uri uri = Uri.parse(url);
      final request = Request('GET', uri);
      request.body = '{"id":1}';

      final response = request.send();
      // final newURI = uri.replace(queryParameters: body);
      // final header = <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // };
      // print('*****************');
      // final response = await http.get(newURI, headers: header);
      print(response);
      return response;
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
