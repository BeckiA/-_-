import 'package:flutter/material.dart';
import 'package:mahlete_eyesus/constants/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../constants/image_strings.dart';

/// Homepage
class YTVideoPlayer extends StatefulWidget {
  const YTVideoPlayer({super.key, required this.videoURL});
  final String videoURL;
  @override
  _YTVideoPlayerState createState() => _YTVideoPlayerState();
}

class _YTVideoPlayerState extends State<YTVideoPlayer> {
  // final videoURL = 'https://youtu.be/VxZfeQt2u0A?si=9hyzfbSyOClZc-YB';
  late YoutubePlayerController _controller;
  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(widget.videoURL);
    _controller = YoutubePlayerController(
        initialVideoId: videoID.toString(),
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          hideControls: false,
          hideThumbnail: false,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: MEPrimaryColor,

        // thumbnail: Container(
        //   decoration: const BoxDecoration(
        //       color: MEPrimaryColor,
        //       image: DecorationImage(
        //         image: AssetImage(
        //           MELogo,
        //         ),
        //       )),
        // ),
      ),
    );
  }
}
