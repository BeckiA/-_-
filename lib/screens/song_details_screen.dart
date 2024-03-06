import 'package:flutter/material.dart';
import 'package:mahlete_eyesus/Utils/connectivity_checker.dart';
import 'package:mahlete_eyesus/models/favorites.dart';
import 'package:mahlete_eyesus/services/favorite_services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../constants/colors.dart';
import '../services/song_selection_services.dart';

class SongDetailsScreen extends StatefulWidget {
  const SongDetailsScreen({super.key});

  @override
  State<SongDetailsScreen> createState() => _SongDetailsScreenState();
}

class _SongDetailsScreenState extends State<SongDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // Instantiating the Selection Service
    final selectionService =
        Provider.of<SongSelectionService>(context, listen: false);
    // Instantiating the FavoriteSelection Services
    final favoriteSelection =
        Provider.of<FavoriteServices>(context, listen: false);
    //Using the Selection Service Value
    final song = selectionService.selectedSong;
    // final singer = singerSelection.name;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(song.name),
        titleTextStyle:
            const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        actions: [
          GestureDetector(
            onTap: () async {
              await Share.share(song.songLyrics['lyrics'].toString());
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.share,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (song.videoURL != '')
            ConnectivityChecker(videoURL: song.videoURL.toString()),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                alignment: Alignment.center,
                child: SelectableText(
                  cursorColor: MEAccentColor,
                  showCursor: true,
                  // ignore: deprecated_member_use
                  toolbarOptions: const ToolbarOptions(
                    copy: true,
                    selectAll: true,
                    cut: false,
                    paste: false,
                  ),
                  song.songLyrics['lyrics'].toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, height: 1.3),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () async {
            if (favoriteSelection.isFavoriteAdded(song)) {
              // Song is already a favorite, handle accordingly (remove or show a message)
              print('Removing song from favorites: ${song.name}');
              favoriteSelection.removeFavorite(song);
            } else {
              // Song is not a favorite, add it
              print('Adding song to favorites: ${song.name}');
              favoriteSelection.add(Favorites(song));
            }

            // Save the updated favorites list
            await favoriteSelection.saveFavorites();
          },
          tooltip: 'Favorites',
          child: Consumer<FavoriteServices>(
            builder: (context, fav, child) {
              return Icon(
                favoriteSelection.isFavoriteAdded(song)
                    ? Icons.favorite
                    : Icons.favorite_outlined,
                color: favoriteSelection.isFavoriteAdded(song)
                    ? Colors.red
                    : Colors.black,
                size: 30,
              );
            },
          )),
    );
  }
}
