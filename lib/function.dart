import 'dart:convert';
import 'dart:io';

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

uploadImage(filepaths, url) async {
  try {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    filepaths.forEach((filepath) async => {
<<<<<<< HEAD
          request.files.add(await http.MultipartFile.fromBytes(
              'images', File(filepath).readAsBytesSync(),
              filename: filepath.split("/").last))
          // request.files
          //     .add(await http.MultipartFile.fromPath('images', filepath))
=======
          request.files.add(await http.MultipartFile.fromPath('images', filepath,filename: filepath.split("/").last))
>>>>>>> 3e9d0d54a3e2ccd8fb227d8d43f234835337f7c4
        });
    var res = await request.send();
<<<<<<< HEAD
    var body = jsonDecode(await res.stream.bytesToString());

    print(body);
    return body;
  } catch (error) {
    print(error);
    throw error;
=======
    var body =jsonDecode(await res.stream.bytesToString());
    print(body["data"]);
    return body["data"];
  } catch (error) {
    rethrow;
>>>>>>> 3e9d0d54a3e2ccd8fb227d8d43f234835337f7c4
  }
}

// uploadImage(filepaths, url) async {
//   print('************************************');
//   List files = [];
//   for (int i = 0; i < filepaths.length; i++) {
//     var file = await File(filepaths[i]);
//     var base64Image = base64Encode(file.readAsBytesSync());
//     files.add(base64Image);
//     var data = {
//       "images": files,
//     };
//     try {
//       var response = await http.post(Uri.parse(url), body: data);
//       print('-********************--**---*-*-*');
//       var body = jsonDecode(response.body);
//       print(body);
//       if (body['msg'] == "Success!") {
//         print('posted successfully!');
//         return body;
//       } else {
//         print(body['msg']);
//       }
//     } catch (e) {
//       print(e);
//       throw e;
//     }
//   }
// }
