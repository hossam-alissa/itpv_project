import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

import '../vlc_player_with_controls.dart';

class FullScreen extends StatefulWidget {
  final String path;

  FullScreen({required this.path});

  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  VlcPlayerController? _controller;
  final _key = GlobalKey<VlcPlayerWithControlsState>();

  x() async {
    try {
      _controller = VlcPlayerController.network(
        widget.path.toString(),
        hwAcc: HwAcc.FULL,
        options: VlcPlayerOptions(
          advanced: VlcAdvancedOptions([
            VlcAdvancedOptions.networkCaching(2000),
          ]),
          subtitle: VlcSubtitleOptions([
            VlcSubtitleOptions.boldStyle(true),
            VlcSubtitleOptions.fontSize(30),
            VlcSubtitleOptions.outlineColor(VlcSubtitleColor.yellow),
            VlcSubtitleOptions.outlineThickness(VlcSubtitleThickness.normal),
            // works only on externally added subtitles
            VlcSubtitleOptions.color(VlcSubtitleColor.navy),
          ]),
          rtp: VlcRtpOptions([
            VlcRtpOptions.rtpOverRtsp(true),
          ]),
        ),
      );
      _controller!.addOnInitListener(() async {
        await _controller!.startRendererScanning();
      });
      _controller!.addOnRendererEventListener((type, id, name) {
        print('OnRendererEventListener $type $id $name');
      });
      print("===== Done full screen initState X =====");
    } catch (error) {
      print("===== error full screen initState X =====");
      print(error);
    }
  }

  y() async {
    try {
      if (_controller != null) {
        await _controller!.setMediaFromNetwork(
          widget.path.toString(),
          hwAcc: HwAcc.FULL,
        );
      }
      print("===== Done full screen initState Y =====");
    } catch (error) {
      print("===== error full screen initState Y =====");
      print(error);
    }
  }

  startScreen() async {
    try {
      await x();
      // await y();
      if(_controller == null){
        print("----- controller is null -----");
      }else{
        print("----- controller is not null -----");
      }
      print("===== Done full screen initState startScreen =====");
    } catch (error) {
      print("===== error full screen initState startScreen =====");
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
    try {
      startScreen();
      print("===== Done full screen initState Main =====");
    } catch (error) {
      print("===== error full screen initState Main =====");
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              child: VlcPlayerWithControls(
                key: _key,
                controller: _controller!,
                showControls: false,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () async{
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.topLeft,
                  height: 40,
                  width: 40,
                  child: Icon(
                    Icons.close,
                    size: 25,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(41),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///dispose all controller
  @override
  void dispose() async {
    super.dispose();
    await _controller!.stopRendererScanning();
    await _controller!.dispose();
  }
}
