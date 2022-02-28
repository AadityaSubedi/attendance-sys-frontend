import 'dart:convert';
import 'dart:html';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  Future<void> register(Map<String, dynamic> data) async {
    final url = Uri.parse('${BACKEND_URL}/user/register');
    var request = http.MultipartRequest('POST', url);
    request.fields["email"] = data["email"];
    request.fields["username"] = data["username"];
    request.fields["password"] = data["password"];
    request.fields["fullname"] = data["fullname"];
    request.fields["subjects"] = jsonEncode(data["subjects"]);
    var response = await request.send();
    var body =await response.stream.bytesToString();
    print(body);
  }
}
