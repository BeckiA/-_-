import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/song_selection_services.dart';
import '../widgets/singer_album_grid.dart';
import '../widgets/singer_name_header.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  @override
  Widget build(BuildContext context) {
    final songSelectionService =
        Provider.of<SongSelectionService>(context, listen: false);
    final singer = songSelectionService.selectedSinger;
    return Scaffold(
        appBar: AppBar(
          title: Text('${singer.name}s Album'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SingerNameHeader(),
              SingerAlbumGrid(),
            ],
          ),
        ));
  }
}
