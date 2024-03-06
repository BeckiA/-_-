import 'package:flutter/material.dart';
import '../Utils/songs_helper/songs_helper.dart';
import '../models/singer.dart';
import '../models/song.dart';
import '../widgets/drawer_contents_widget.dart';
import '../widgets/search_helpers/search_bar_widget.dart';
import '../widgets/singers_category_widget.dart';

class SingersPage extends StatefulWidget {
  const SingersPage({super.key});

  @override
  State<SingersPage> createState() => _SingersPageState();
}

class _SingersPageState extends State<SingersPage> {
  // Getting Mocked Datas From The Helper Class
  List<Singer> singer = SongHelper.getMockedSongs();

  List<Song> allSongs = SongHelper.getAllSongs();

  DateTime? lastPressedTime;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        DateTime currentTime = DateTime.now();
        bool backButton = lastPressedTime == null ||
            currentTime.difference(lastPressedTime!) >
                const Duration(seconds: 2);

        if (backButton) {
          lastPressedTime = currentTime;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tap again to exit'),
              duration: Duration(seconds: 2),
            ),
          );
          return false;
        }
        return true;
      },
      child: Scaffold(
        drawer: const Drawer(
          child: DrawerContent(),
        ),
        appBar: AppBar(
          title: const Text(
            'ማሕሌተ ኢየሱስ',
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Column(children: [
          MESearchBar(allSongs: allSongs),
          const SizedBox(
            height: 20,
          ),
          SingersCategoryWidget(singer: singer),
        ]),
      ),
    );
  }
}
