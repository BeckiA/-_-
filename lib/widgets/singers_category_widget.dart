import 'package:flutter/material.dart';
import 'package:mahlete_eyesus/services/song_selection_services.dart';
import 'package:provider/provider.dart';

import '../models/singer.dart';
import '../screens/song_albums_screen.dart';

class SingersCategoryWidget extends StatelessWidget {
  const SingersCategoryWidget({
    super.key,
    required this.singer,
  });

  final List<Singer> singer;

  @override
  Widget build(BuildContext context) {
    final songSelectionService =
        Provider.of<SongSelectionService>(context, listen: false);
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: singer.length,
        itemBuilder: (context, index) => Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () {
                          songSelectionService.selectedSinger = singer[index];
                          if (songSelectionService.selectedSinger != null) {
                            Navigator.of(context).pushNamed('/albumspage');
                            print(songSelectionService.selectedSinger.name);
                          } else {
                            print('Error');
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(singer[index].photo))),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.2),
                                    Colors.transparent
                                  ])),
                        ))
                  ],
                ),
              ),
            ),
            Text(
              singer[index].name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
