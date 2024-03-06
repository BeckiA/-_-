import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mahlete_eyesus/models/favorites.dart';
import 'package:mahlete_eyesus/models/song.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteServices extends ChangeNotifier {
  final List<Favorites> _favoriteList = [];

  static const _favoritesKey = 'favorites';

  UnmodifiableListView<Favorites> get favorites =>
      UnmodifiableListView(_favoriteList);

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  void add(Favorites favorite) async {
    if (!isFavoriteAdded(favorite.favoriteSong)) {
      _favoriteList.add(favorite);
      notifyListeners();
      await saveFavorites();
    }
  }

  // Method to remove a song from favorites
  void removeFavorite(Song song) async {
    _favoriteList.removeWhere(
        (Favorites favorites) => favorites.favoriteSong.name == song.name);
    notifyListeners();
    await saveFavorites();
  }

  bool isFavoriteAdded(Song song) {
    return _favoriteList.isNotEmpty
        ? _favoriteList.any(
            (Favorites favorite) => favorite.favoriteSong.name == song.name)
        : false;
  }

  // Method to load favorites from local storage
  Future<void> loadFavorites() async {
    if (_isInitialized) {
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    final favoritesData = prefs.getStringList(_favoritesKey);
    if (favoritesData != null) {
      _favoriteList.addAll(favoritesData.map((jsonString) {
        Map valueMap = json.decode(jsonString);
        try {
          // Check if jsonString is not null before calling fromJson
          return Favorites.fromJson(valueMap);
        } catch (e) {
          // Handle the error or log it if needed
          print('Error decoding JSON THIS ONE: $e');
          return null;
        }
      }).whereType<Favorites>()); // Filters out null values

      notifyListeners();
    }
    _isInitialized = true; // Set the flag to true after loading favorites
  }

  // Method to save favorites to local storage
  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    // Convert each map to a JSON string using jsonEncode
    final favoritesData = _favoriteList
        .map((favorites) => jsonEncode(favorites.toJson()))
        .toList();

    // Store the list of dynamic objects (JSON strings) in shared preferences
    prefs.setStringList(_favoritesKey, favoritesData);
    // print(favoritesData);
    notifyListeners();
  }
}
