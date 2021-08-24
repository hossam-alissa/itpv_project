import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

import 'models/models.dart';
import 'setings/setting.dart';
import 'vlc_player_with_controls.dart';

class SingleTab extends StatefulWidget {
  @override
  _SingleTabState createState() => _SingleTabState();
}

class _SingleTabState extends State<SingleTab> {
  ///get data from user example "filename.m3u"
  Future<void> openFile() async {
    print("----- openFile -----");
    var filePath = r'/storage/emulated/0/update.apk';
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      filePath = result.files.single.path!;
    } else {
      /// User canceled the picker
    }
    final _myFile = File(filePath);
    final List<String> listData = await _myFile.readAsLines(encoding: utf8);
    Provider.of<Channels>(contextProvider!, listen: false).addChannels(listData);
  }

  VlcPlayerController? _controller;
  final _key = GlobalKey<VlcPlayerWithControlsState>();
  int? selectedVideoIndex;

  Future<File> _loadVideoToFs() async {
    final videoData = await rootBundle.load('assets/sample.mp4');
    final videoBytes = Uint8List.view(videoData.buffer);
    var dir = (await getTemporaryDirectory()).path;
    var temp = File('$dir/temp.file');
    temp.writeAsBytesSync(videoBytes);
    return temp;
  }

  x() {
    selectedVideoIndex = 0;
    var initVideo = Provider.of<Channels>(contextProvider!, listen: false)
        .allChannels![selectedVideoIndex!.toInt()];
    switch (initVideo.type!) {
      case VideoType.network:
        _controller = VlcPlayerController.network(
          initVideo.path.toString(),
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
        break;
      case VideoType.file:
        var file = File(initVideo.path.toString());
        _controller = VlcPlayerController.file(
          file,
        );
        break;
      case VideoType.asset:
        _controller = VlcPlayerController.asset(
          initVideo.path.toString(),
          options: VlcPlayerOptions(),
        );
        break;
    }
    _controller!.addOnInitListener(() async {
      await _controller!.startRendererScanning();
    });
    _controller!.addOnRendererEventListener((type, id, name) {
      print('OnRendererEventListener $type $id $name');
    });
  }

  @override
  void initState() {
    super.initState();
    x();
    // selectedVideoIndex = 0;
    // var initVideo = Provider.of<Channels>(context , listen: false).allChannels![selectedVideoIndex!.toInt()];
    // switch (initVideo.type!) {
    //   case VideoType.network:
    //     _controller = VlcPlayerController.network(
    //       initVideo.path.toString(),
    //       hwAcc: HwAcc.FULL,
    //       options: VlcPlayerOptions(
    //         advanced: VlcAdvancedOptions([
    //           VlcAdvancedOptions.networkCaching(2000),
    //         ]),
    //         subtitle: VlcSubtitleOptions([
    //           VlcSubtitleOptions.boldStyle(true),
    //           VlcSubtitleOptions.fontSize(30),
    //           VlcSubtitleOptions.outlineColor(VlcSubtitleColor.yellow),
    //           VlcSubtitleOptions.outlineThickness(VlcSubtitleThickness.normal),
    //           // works only on externally added subtitles
    //           VlcSubtitleOptions.color(VlcSubtitleColor.navy),
    //         ]),
    //         rtp: VlcRtpOptions([
    //           VlcRtpOptions.rtpOverRtsp(true),
    //         ]),
    //       ),
    //     );
    //     break;
    //   case VideoType.file:
    //     var file = File(initVideo.path.toString());
    //     _controller = VlcPlayerController.file(
    //       file,
    //     );
    //     break;
    //   case VideoType.asset:
    //     _controller = VlcPlayerController.asset(
    //       initVideo.path.toString(),
    //       options: VlcPlayerOptions(),
    //     );
    //     break;
    // }
    // _controller!.addOnInitListener(() async {
    //   await _controller!.startRendererScanning();
    // });
    // _controller!.addOnRendererEventListener((type, id, name) {
    //   print('OnRendererEventListener $type $id $name');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: Text('Tap to open file'),
                onPressed: () {
                  openFile();
                },
              ),
              TextButton(
                child: Text('info'),
                onPressed: () {},
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
        Container(
          height: 400,
          child: VlcPlayerWithControls(key: _key, controller: _controller!),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: Provider.of<Channels>(contextProvider!, listen: true)
              .allChannels!
              .length
              .toInt(),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            Channel video = Provider.of<Channels>(contextProvider!, listen: true).allChannels![index];

            return ListTile(
              selected: Provider.of<Channels>(contextProvider!, listen: true)
                      .indexChannelPlayNow ==
                  index,
              selectedTileColor: Colors.black54,
              title: Text(
                video.tvgName.toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Provider.of<Channels>(contextProvider!, listen: true)
                              .indexChannelPlayNow ==
                          index
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              subtitle: Text(
                video.path.toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Provider.of<Channels>(contextProvider!, listen: true)
                              .indexChannelPlayNow ==
                          index
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              onTap: () async {
                    await _controller!.setMediaFromNetwork(
                      video.path.toString(),
                      hwAcc: HwAcc.FULL,
                    );
                //   selectedVideoIndex = index;
                Provider.of<Channels>(contextProvider!, listen: false).indexChannelPlayNow = index;
                setState(() {
                  print(Provider.of<Channels>(contextProvider!, listen: false)
                      .indexChannelPlayNow);
                  print(index);
                });
              },
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() async {
    super.dispose();
    await _controller!.stopRendererScanning();
    await _controller!.dispose();
  }
}
