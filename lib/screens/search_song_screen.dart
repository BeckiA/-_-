import 'package:flutter/material.dart';
import 'package:mahlete_eyesus/constants/colors.dart';
import 'package:mahlete_eyesus/services/song_selection_services.dart';
import 'package:provider/provider.dart';
import '../models/song.dart';
import '../widgets/search_helpers/search_result_widget.dart';

class SearchSong extends StatefulWidget {
  const SearchSong({super.key});

  @override
  _SearchSongState createState() => _SearchSongState();
}

class _SearchSongState extends State<SearchSong> {
  final TextEditingController searchController = TextEditingController();
  List<Song> searchResults = [];

  @override
  Widget build(BuildContext context) {
    final selectionService = Provider.of<SongSelectionService>(context);

    final searchedSong = selectionService.searchedSong;
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Search',
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
            ),
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search...',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: MEPrimaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15)),
                  onPressed: () {
                    String query = searchController.text;

                    setState(() {
                      // Filter songs based on the normalized search query
                      if (query == "") {
                        searchResults = [];
                      } else {
                        searchResults = searchedSong
                            .where((song) => song.name.contains(query))
                            .toList();
                      }
                    });
                  },
                  child: const Text('Search'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Display search results
          if (searchResults.isNotEmpty)
            SearchResult(
                searchResults: searchResults,
                selectionService: selectionService)
        ],
      ),
    );
  }
}
