import 'package:flutter/material.dart';
import '../models/albums.dart';
import '../models/singer.dart';
import '../models/song.dart';

class SongSelectionService extends ChangeNotifier {
  late Song _selectedSong;
  late Singer _selectedSinger;
  late Albums _selectedAlbum;
  List<Song> _searchedSong = [];
  String _selectedSingerName = '';

  Song get selectedSong => _selectedSong;
  set selectedSong(Song value) {
    _selectedSong = value;
    notifyListeners();
  }

  List<Song> get searchedSong => _searchedSong;
  set searchedSong(List<Song> value) {
    _searchedSong = value;
    notifyListeners();
  }

  Singer get selectedSinger => _selectedSinger;
  set selectedSinger(Singer value) {
    _selectedSinger = value;
    notifyListeners();
  }

  String get selectedSingerName => _selectedSingerName;
  set selectedSingerName(String value) {
    _selectedSingerName = value;
    notifyListeners();
  }

  Albums get selectedAlbum => _selectedAlbum;
  set selectedAlbum(Albums value) {
    _selectedAlbum = value;
    notifyListeners();
  }
}
