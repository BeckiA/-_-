import 'song.dart';

class Albums {
  String name;
  String photo;
  DateTime realeasedDate;
  int albumNumber;
  List<Song> songs;

  Albums(
      {required this.name,
      required this.photo,
      required this.realeasedDate,
      required this.albumNumber,
      required this.songs});
}
