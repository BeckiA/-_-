import 'package:flutter/material.dart';
import 'package:mahlete_eyesus/services/song_selection_services.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../models/song.dart';

class SongListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SongSelectionService selectionService =
        Provider.of<SongSelectionService>(context, listen: false);

    // Selection Service Values
    List<Song> songs = selectionService.selectedAlbum.songs;
    final albumName = selectionService.selectedAlbum.name;
    final singer = selectionService.selectedSinger;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          albumName,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MEWhiteColor,
              ),
              margin: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 0, top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  selectionService.selectedSong = songs[index];
                  selectionService.selectedSinger = singer;
                  Navigator.pushNamed(context, '/lyricspage');
                },
                child: ListTile(
                  leading: Text(
                    '${index + 1}',
                    style: const TextStyle(fontSize: 21),
                  ),
                  title: Text(
                    songs[index].name,
                    style: const TextStyle(fontSize: 21),
                  ),
                  subtitle: Text(
                    singer.name,
                    style: const TextStyle(fontSize: 16),
                  ),
                  trailing: const Icon(
                    Icons.arrow_right,
                    size: 30,
                  ),
                ),
              ));
        },
      ),
    );
  }
}
