import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/song_selection_services.dart';

class SingerNameHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final songSelectionService =
        Provider.of<SongSelectionService>(context, listen: false);
    final singer = songSelectionService.selectedSinger;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.all(7.0),
      alignment: Alignment.center,
      child: Text(
        singer.name,
        style: const TextStyle(
            fontSize: 24,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
