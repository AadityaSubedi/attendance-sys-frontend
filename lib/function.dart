import 'dart:convert';


import 'package:http/http.dart' as http;


fetchData(String url, String? className, String? subName) async {
  try {
    print('###################');
final body = jsonEncode({
      'classname': className,
      'subjectname': subName,
    });
final uri = Uri.http('192.168.1.71:5000/api', url);
//final uri = Uri.http('192.168.1.71:5000/api', url);
 final header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
final response = await http.post(uri, headers: header, body: body);

    // var data = jsonEncode({
    //   'classname': className,
    //   'subjectname': subName,
    // });
    // final response = await http.post(Uri.parse(url), body: data,  headers: <String, String>{
    //   'Content-Type': 'application/json; charset=UTF-8',
    // },);

    print(response.body);
    return response.body;
  } catch (error) {
    return error;
  }
}
