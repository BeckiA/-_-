import 'package:flutter/material.dart';
import 'package:mahlete_eyesus/services/song_selection_services.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../models/song.dart';

class MESearchBar extends StatelessWidget {
  MESearchBar({super.key, required this.allSongs});
  final List<Song> allSongs;
  @override
  Widget build(BuildContext context) {
    var searchService = Provider.of<SongSelectionService>(context);

    return GestureDetector(
      onTap: () {
        searchService.searchedSong = allSongs;
        Navigator.of(context).pushNamed("/searchpage");
      },
      child: Container(
        margin: const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 5),
        padding: const EdgeInsets.all(15),
        // height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
          color: MEWhiteColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              "Search here...",
              style: TextStyle(fontSize: 25, color: Colors.grey),
            ),
            Icon(
              Icons.search_outlined,
              size: 30,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
