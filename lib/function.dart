
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;


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


uploadImage(filepaths, url, {label = null}) async {
  try {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    filepaths.forEach((filepath) async => {
          request.files.add(await http.MultipartFile.fromBytes(
              'images', File(filepath).readAsBytesSync(),
              filename: filepath))
          // request.files
          //     .add(await http.MultipartFile.fromPath('images', filepath))
        });
    request.fields['label'] = label;
    var res = await request.send();
    var body = jsonDecode(await res.stream.bytesToString());

    // print(body);
    return body['data'];
  } catch (error) {
    print(error);
    throw error;
  }
}