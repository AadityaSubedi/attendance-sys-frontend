import 'dart:convert';
import 'dart:html';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> register(Map<String, dynamic> data) async {
    try {
      final url = Uri.parse('${BACKEND_URL}/user/register');
      var request = http.MultipartRequest('POST', url);
      request.fields["email"] = data["email"];
      request.fields["username"] = data["username"];
      request.fields["password"] = data["password"];
      request.fields["fullname"] = data["fullname"];
      request.fields["subjects"] = jsonEncode(data["subjects"]);
      var response = await request.send();
      var body = await response.stream.bytesToString();
      print(body);
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(Map<String, dynamic> data) async {
    try {
      final url = Uri.parse('${BACKEND_URL}/user/login');
      print(data);
      final response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(data));
      var body = json.decode(response.body);
      if (response.statusCode != 200) {
        throw json.decode(response.body)["message"];
      }
      _token = body["access_token"];
      // the  token expiry time is set to default 24 hours in backend
      _expiryDate = DateTime.now().add(Duration(hours: 24));
    } catch (error) {
      rethrow;
      
    }
  }
}
