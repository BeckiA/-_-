import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/favorite_services.dart';
import '../widgets/favorite_helpers/favorite_display_wiget.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  @override
  Widget build(BuildContext context) {
    final favoritesService =
        Provider.of<FavoriteServices>(context, listen: false);
    print('Number of favorites: ${favoritesService.favorites.length}');

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'የተወደዱ',
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: FutureBuilder(
          future: !favoritesService.isInitialized
              ? favoritesService.loadFavorites()
              : null,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // If the Future is still running, show a loading indicator
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // If an error occurred, show an error message
              return Center(
                  child: Text('Error loading favorites: ${snapshot.error}'));
            } else {
              // If the Future is complete, build the UI with the loaded data
              return const FavoriteDisplay();
            }
          },
        ));
  }
}
