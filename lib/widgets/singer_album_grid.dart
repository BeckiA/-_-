import 'package:flutter/material.dart';
import 'package:mahlete_eyesus/models/song.dart';
import 'package:mahlete_eyesus/services/song_selection_services.dart';
import 'package:provider/provider.dart';

class SingerAlbumGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Song> songs;
    final songSelectionService =
        Provider.of<SongSelectionService>(context, listen: false);
    final albumSelectionService =
        Provider.of<SongSelectionService>(context, listen: false);
    var singer = songSelectionService.selectedSinger;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.all(7.0),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemCount: singer.albums.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  albumSelectionService.selectedAlbum = singer.albums[index];
                  songs = albumSelectionService.selectedAlbum.songs;
                  albumSelectionService.selectedAlbum.name;
                  singer.name;
                  Navigator.of(context).pushNamed('/songlistpage');
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                            image: AssetImage(
                              singer.albums[index].photo,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      singer.albums[index].name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
