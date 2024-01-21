import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PelajariTeknikScreen extends StatefulWidget {
  const PelajariTeknikScreen({Key? key}) : super(key: key);

  @override
  _PelajariTeknikScreenState createState() => _PelajariTeknikScreenState();
}

class _PelajariTeknikScreenState extends State<PelajariTeknikScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'Y5O5qhHFDYg', // Ganti dengan ID video YouTube yang baru
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pelajari Teknik'),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
