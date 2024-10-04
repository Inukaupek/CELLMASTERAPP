import 'dart:convert';
import 'package:cellmasterapp/services/globals.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static Future<http.Response> Register(String name, String address,
      String email, String contact, String password) async {
    Map data = {
      'name': name,
      'address': address,
      'email': email,
      'contact': contact,
      'password': password
    };

    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/register');
    http.Response response = await http.post(url, headers: headers, body: body);

    print(response.body);
    return response;
  }

  static Future<http.Response> Login(String email, String password) async {
    Map data = {'email': email, 'password': password};

    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/login');
    http.Response response = await http.post(url, headers: headers, body: body);

    print(response.body);
    return response;
  }
}
