class Song {
  String name;
  Map<String, dynamic> songLyrics;
  String singerName;
  String? videoURL;
  bool isFavorite;
  Song(
      {required this.name,
      required this.songLyrics,
      this.videoURL,
      this.isFavorite = false,
      this.singerName = ''});

  // Convert Song object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'songLyrics': songLyrics,
      'videoURL': videoURL,
      'singerName': singerName,
      'isFavorite': isFavorite
    };
  }

  // Create Song object from JSON
  factory Song.fromJson(Map<String, dynamic> jsonMap) {
    return Song(
      name: jsonMap['name'],
      songLyrics: jsonMap['songLyrics'],
      videoURL: jsonMap['videoURL'],
      singerName: jsonMap['singerName'],
      isFavorite: jsonMap['isFavorite'],
    );
  }
}
