import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  Map<String, dynamic>? _userData;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  Map<String, dynamic>? get userData => _userData;
  bool get isLoggedIn => _userData != null; // Add this getter to track login state

  // Modify the return type to Future<bool> to return success or failure status
  Future<bool> login(String username, String password) async {
    final url = Uri.parse('https://dummyjson.com/user/login');
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
          'expiresInMins': 30,
        }),
      );

      if (response.statusCode == 200) {
        _userData = json.decode(response.body);
        print('Login Successful: $_userData');
        return true;  // Return true when login is successful
      } else {
        _errorMessage = 'Login failed: ${response.statusCode}';
        print('Error: $response.body');
        return false;  // Return false if login fails
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
      print(_errorMessage);
      return false;  // Return false if there was an error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}