import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ProductProvider with ChangeNotifier {
  List<dynamic> _products = [];
  List<dynamic> _favorites = [];
  bool _isLoading = false;
  String _error = '';

  List<dynamic> get products => _products;
  List<dynamic> get favorites => _favorites;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _error = ''; // Reset any previous errors
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        _products = data['products'];
      } else {
        _error = 'Failed to load products';
      }
    } catch (e) {
      _error = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleFavorite(Map<String, dynamic> product) async {
    final productId = product['id'];

    // Check if the product is already in favorites
    final existingIndex = _favorites.indexWhere((item) => item['id'] == productId);

    if (existingIndex >= 0) {
      // Remove from favorites
      _favorites.removeAt(existingIndex);
    } else {
      // Add to favorites
      _favorites.add(product);
    }

    notifyListeners();

    // Save favorites to SharedPreferences
    await saveFavoritesToLocal();
  }

  Future<void> saveFavoritesToLocal() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('favorites', json.encode(_favorites));
  }

  Future<void> loadFavoritesFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFavorites = prefs.getString('favorites');

    if (savedFavorites != null) {
      _favorites = json.decode(savedFavorites);
      notifyListeners();
    }
  }
}
