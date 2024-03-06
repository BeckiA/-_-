import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../models/song.dart';
import '../../services/song_selection_services.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    super.key,
    required this.searchResults,
    required this.selectionService,
  });

  final List<Song> searchResults;
  final SongSelectionService selectionService;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 0,
          ),
          padding:
              const EdgeInsets.only(top: 15, bottom: 7, left: 15, right: 15),
          child: const Text('Search Results:',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: MEPrimaryColor)),
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display search results as a list
                for (Song song in searchResults)
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MEWhiteColor,
                      ),
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 0, top: 15),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          selectionService.selectedSong = song;
                          selectionService.selectedSingerName = song.singerName;
                          Navigator.pushNamed(context, '/lyricspage');
                        },
                        child: ListTile(
                          title: Text(
                            song.name,
                            style: const TextStyle(fontSize: 21),
                          ),
                          subtitle: Text(
                            song.singerName,
                            style: const TextStyle(fontSize: 16),
                          ),
                          trailing: const Icon(
                            Icons.arrow_right,
                            size: 30,
                          ),
                        ),
                      ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
