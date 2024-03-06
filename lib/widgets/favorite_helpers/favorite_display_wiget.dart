import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/image_strings.dart';
import '../../models/favorites.dart';
import '../../services/favorite_services.dart';
import '../../services/song_selection_services.dart';

class FavoriteDisplay extends StatefulWidget {
  const FavoriteDisplay({super.key});

  @override
  State<FavoriteDisplay> createState() => _FavoriteDisplayState();
}

class _FavoriteDisplayState extends State<FavoriteDisplay> {
  @override
  Widget build(BuildContext context) {
    final selectionService =
        Provider.of<SongSelectionService>(context, listen: false);
    final favoritesService =
        Provider.of<FavoriteServices>(context, listen: false);
    List<Favorites> songs = favoritesService.favorites;
    return songs.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(NoFavorites),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const Text(
                      "ምንም መዝሙር አልመረጡም ለመምረጥ የ ❤ ምልክቷን ይጫኑ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ))
              ],
            ),
          )
        : ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(favoritesService),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  favoritesService.removeFavorite(songs[index].favoriteSong);
                  setState(() {});
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MEWhiteColor,
                    ),
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 0, top: 15),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        selectionService.selectedSong =
                            songs[index].favoriteSong;
                        Navigator.pushNamed(context, '/lyricspage');
                      },
                      child: ListTile(
                        leading: Text(
                          '${index + 1}',
                          style: const TextStyle(fontSize: 21),
                        ),
                        title: Text(
                          songs[index].favoriteSong.name,
                          style: const TextStyle(fontSize: 21),
                        ),
                        trailing: const Icon(
                          Icons.arrow_right,
                          size: 30,
                        ),
                      ),
                    )),
              );
            },
          );
  }
}
