import 'package:flutter/material.dart';
import 'package:mahlete_eyesus/screens/search_song_screen.dart';
import 'package:mahlete_eyesus/screens/singers_screen.dart';
import 'package:mahlete_eyesus/screens/song_details_screen.dart';
import 'package:mahlete_eyesus/screens/song_titles_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Utils/theme.dart';
import 'screens/song_albums_screen.dart';
import 'screens/splash_screen.dart';
import 'services/favorite_services.dart';
import 'services/song_selection_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Check if the action has been performed
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool actionPerformed = prefs.getBool('actionPerformed') ?? false;
  // Perform the action only if it hasn't been performed before
  if (!actionPerformed) {
    // Perform your one-time action here
    await FavoriteServices().loadFavorites();
    // Set the flag to indicate that the action has been performed
    prefs.setBool('actionPerformed', true);
  }

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SongSelectionService(),
      ),
      ChangeNotifierProvider(
        create: (context) => FavoriteServices(),
      ),
    ],
    child: MaterialApp(
      title: 'ማህሌተ ኢየሱስ',
      theme: METheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/singerspage': (context) => SingersPage(),
        '/albumspage': (context) => AlbumsScreen(),
        '/songlistpage': (context) => SongListScreen(),
        '/lyricspage': (context) => const SongDetailsScreen(),
        '/searchpage': (context) => const SearchSong()
      },
    ),
  ));
}
