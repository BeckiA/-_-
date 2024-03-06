import 'dart:convert';
import 'package:mahlete_eyesus/models/song.dart';

class Favorites {
  Song favoriteSong;
  Favorites(this.favoriteSong);

  // Convert Favorites object to JSON
  Map<String, dynamic> toJson() {
    return {
      'favoriteSong': jsonEncode(favoriteSong.toJson()),
    };
  }

// Create Favorites object from JSON
  factory Favorites.fromJson(Map value) {
    dynamic valueMap = value['favoriteSong'];
    Map realMap = json.decode(valueMap);
    print("FROM JSON: ${realMap is Map<String, dynamic>}");
    if (realMap is Map<String, dynamic>) {
      return Favorites(
        Song.fromJson(realMap),
      );
    } else {
      // Handle the case where json is not a Map
      throw const FormatException('Invalid JSON format for Favorites');
    }
  }
}
