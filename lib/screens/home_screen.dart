import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itpv_project/models/models.dart';
import 'package:provider/provider.dart';

import 'screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///get data from user example "filename.m3u"
  Future<void> openFile() async {
    try{
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
      Provider.of<Channels>(context, listen: false).addChannels(listData);

      print("----- Done Open file -----");
    }catch(error){
      print("----- Error Open file -----");
      print(error);
    }
  }


  // Future<File> _loadVideoToFs() async {
  //   final videoData = await rootBundle.load('assets/sample.mp4');
  //   final videoBytes = Uint8List.view(videoData.buffer);
  //   var dir = (await getTemporaryDirectory()).path;
  //   var temp = File('$dir/temp.file');
  //   temp.writeAsBytesSync(videoBytes);
  //   return temp;
  // }

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
        ListView.builder(
          shrinkWrap: true,
          itemCount: Provider.of<Channels>(context, listen: true)
              .allChannels!
              .length
              .toInt(),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            Channel video = Provider.of<Channels>(context, listen: true)
                .allChannels![index];

            return ListTile(
              selected: Provider.of<Channels>(context, listen: true)
                  .indexChannelPlayNow ==
                  index,
              selectedTileColor: Colors.black54,
              title: Text(
                video.tvgName.toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Provider.of<Channels>(context, listen: true)
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
                  color: Provider.of<Channels>(context, listen: true)
                      .indexChannelPlayNow ==
                      index
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              onTap: () async {
                try{
                  print("===== Start Channel info =====");
                  print("=${video.tvgId}=${video.tvgName}=${video.tvgCountry}=${video.tvgLanguage}=${video.tvgLogo}=${video.groupTitle}${video.country}");
                  print("===== End Channel info =====");

                  Provider.of<Channels>(context, listen: false).indexChannelPlayNow = index;

                  // setState(() {
                  //   print(Provider.of<Channels>(context, listen: false)
                  //       .indexChannelPlayNow);
                  //   print(index);
                  // });

                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FullScreen(path: video.path.toString(),)));
                  print("===== Done Single Tap =====");
                }catch(error){
                  print("===== error Single Tab =====");
                  print(error);
                }
              },
            );
          },
        ),
      ],
    );
  }
}
