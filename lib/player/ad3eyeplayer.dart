import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import '../ad3eye/الأدعية.dart';

class Ad3eyeplayer extends StatefulWidget {
  const Ad3eyeplayer(this.do3a, {super.key});
  // ignore: prefer_typing_uninitialized_variables
  final do3a;
  String get mohammad {
    return audiochooser[do3a]!;
  }

  @override
  State<Ad3eyeplayer> createState() => _Ad3eyeplayerState();
}

class _Ad3eyeplayerState extends State<Ad3eyeplayer> {
  final player = AudioPlayer();
  void handlePlayPause() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
  }

  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
  }

  void handleSeek(double value) {
    player.seek(Duration(seconds: value.toInt()));
  }

  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    player.setAsset(audiochooser[widget.do3a]!);

    player.positionStream.listen((p) {
      setState(() => position = p);
    });

    player.durationStream.listen((d) {
      setState(() => duration = d!);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var avg = (MediaQuery.of(context).size.width +
            MediaQuery.of(context).size.height) /
        2;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
            onPressed: () {
              if (player.playing) {
                player.pause();
              }
              Navigator.pop(context);
            },
          ),
          automaticallyImplyLeading: false,
          toolbarHeight: width > 700 ? width / 16 : width / 8.5,
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            inarabic[widget.do3a]!,
            style: GoogleFonts.lalezar(
                fontSize: width > 800 ? width / 20 : width / 10,
                fontWeight: FontWeight.w200),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  height > 540
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  width > 700.0 ? width * 0.15 : width * 0.075),
                          child: Slider(
                              min: 0.0,
                              max: duration.inSeconds.toDouble(),
                              value: position.inSeconds.toDouble(),
                              onChanged: handleSeek),
                        )
                      : Container(),
                  Text(formatDuration(duration)),
                  SizedBox(
                    height: height > 600 ? height * 0.02 : 0,
                  ),
                  IconButton.outlined(
                      iconSize: width > 600 ? 50 : width / 15,
                      onPressed: handlePlayPause,
                      icon:
                          Icon(player.playing ? Icons.pause : Icons.play_arrow))
                ],
              ),
            ),
            SizedBox(
              height: width > 900 ? height * 0.57 : height * 0.67,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: width > 700 ? width * 0.15 : 25),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18)),
                      child: Column(children: [
                        SizedBox(
                          height: avg * 0.07,
                        ),
                        Text(
                          textAlign: TextAlign.right,
                          dailyAd3eya[widget.do3a]!,
                          style:
                              GoogleFonts.readexPro(fontSize: 22, height: 2.6),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
