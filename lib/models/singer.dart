class Singer {
  String name;
  String photo;
  String singerId;
  List albums = [];

  Singer(
      {required this.name,
      required this.photo,
      required this.singerId,
      required this.albums});

  // Convert Song object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'photo': photo,
      'singerId': singerId,
      'albums': albums
    };
  }

  // Create Song object from JSON
  factory Singer.fromJson(Map<String, dynamic> jsonMap) {
    return Singer(
      name: jsonMap['name'],
      photo: jsonMap['photo'],
      singerId: jsonMap['singerId'],
      albums: jsonMap['albums'],
    );
  }
}
