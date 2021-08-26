import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itpv_project/models/models.dart';
import 'package:itpv_project/screens/live_tv_screen.dart';
import 'package:itpv_project/settings/setting.dart';
import 'package:provider/provider.dart';

import 'screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///get data from user example "filename.m3u"
  Future<void> openFile() async {
    try {
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
    } catch (error) {
      print("----- Error Open file -----");
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(heightSizeScreen);
    print(widthSizeScreen);
    return SafeArea(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                color: Colors.black,
                height: heightSizeScreen! / 3,
                width: widthSizeScreen! / 3,
                child: Center(
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
                        onPressed: () {
                          setState(() {
                            themeNumber = 1;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: double.maxFinite,
                  width: widthSizeScreen! / 3,
                  color: secondColor[themeNumber],
                  child: ListView(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const LiveTvScreen(),
                            ),
                          );
                        },
                        child: listViewItem(
                            "assets/images_svg/1.svg", "LIVE TV"),
                    // "assets/images_svg/live_tv_icon.svg", "LIVE TV"),
                      ),
                      SizedBox(height: 2.0),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push<void>(
                          //   context,
                          //   MaterialPageRoute<void>(
                          //     builder: (BuildContext context) =>
                          //         const LiveTvScreen(),
                          //   ),
                          // );
                        },
                        child: listViewItem(
                            "assets/images_svg/2.svg", "MOVIES"),
                      ),
                      SizedBox(height: 2.0),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push<void>(
                          //   context,
                          //   MaterialPageRoute<void>(
                          //     builder: (BuildContext context) =>
                          //         const LiveTvScreen(),
                          //   ),
                          // );
                        },
                        child: listViewItem(
                            "assets/images_svg/3.svg", "SERIES"),
                      ),
                      SizedBox(height: 2.0),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push<void>(
                          //   context,
                          //   MaterialPageRoute<void>(
                          //     builder: (BuildContext context) =>
                          //         const LiveTvScreen(),
                          //   ),
                          // );
                        },
                        child: listViewItem(
                            "assets/images_svg/4.svg", "SPORTS GUIDE"),
                      ),
                      SizedBox(height: 2.0),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push<void>(
                          //   context,
                          //   MaterialPageRoute<void>(
                          //     builder: (BuildContext context) =>
                          //         const LiveTvScreen(),
                          //   ),
                          // );
                        },
                        child: listViewItem(
                            "assets/images_svg/5.svg", "TV GUIDE"),
                      ),
                      SizedBox(height: 2.0),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push<void>(
                          //   context,
                          //   MaterialPageRoute<void>(
                          //     builder: (BuildContext context) =>
                          //         const LiveTvScreen(),
                          //   ),
                          // );
                        },
                        child: listViewItem(
                            "assets/images_svg/6.svg", "SETTING"),
                      ),
                      SizedBox(height: 2.0),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push<void>(
                          //   context,
                          //   MaterialPageRoute<void>(
                          //     builder: (BuildContext context) =>
                          //         const LiveTvScreen(),
                          //   ),
                          // );
                        },
                        child: listViewItem(
                            "assets/images_svg/7.svg", "Pay App"),
                      ),
                      SizedBox(height: 2.0),
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              color: mainColor[themeNumber],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Featured Movies" ,style: styleListView),
                  Container(
                    alignment: Alignment.topCenter,
                    height: heightSizeScreen! / 3,
                    width: double.maxFinite,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: Provider.of<Channels>(context, listen: true)
                          .allChannels!
                          .length
                          .toInt(),
                      itemBuilder: (BuildContext context, int index) {
                        Channel video =
                        Provider.of<Channels>(context, listen: true)
                            .allChannels![index];
                        return channelView(video, context);
                      },
                    ),
                  ),
                  Text("Featured Movies", style: styleListView,),
                  Container(
                    alignment: Alignment.topCenter,
                    height: heightSizeScreen! / 3,
                    width: double.maxFinite,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: Provider.of<Channels>(context, listen: true)
                          .allChannels!
                          .length
                          .toInt(),
                      itemBuilder: (BuildContext context, int index) {
                        Channel video =
                            Provider.of<Channels>(context, listen: true)
                                .allChannels![index];
                        return channelView(video, context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget channelView(
  Channel channel,
  BuildContext context,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    child: GestureDetector(
      onTap: () {
        try {
          print("===== Start Channel info =====");
          print(
              "=${channel.tvgId}=${channel.tvgName}=${channel.tvgCountry}=${channel.tvgLanguage}=${channel.tvgLogo}=${channel.groupTitle}${channel.country}");
          print("===== End Channel info =====");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => FullScreen(
                        path: channel.path.toString(),
                      )));
          print("===== Done Single Tap =====");
        } catch (error) {
          print("===== error Single Tab =====");
          print(error);
        }
      },
      child: Column(
        children: [
          Container(
            height: heightSizeScreen! / 4.5,
            width: heightSizeScreen! / 4.5,
            child: Image.network(
              channel.tvgLogo.toString(),
              fit: BoxFit.fill,
            ),
          ),
          Expanded(child: Text(channel.tvgName.toString(),style: styleListView,overflow: TextOverflow.ellipsis,)),
        ],
      ),
    ),
  );
}

Widget listViewItem(
  String imgUrl,
  String title,
) {
  return Container(
    height: heightSizeScreen! / 11,
    color: mainColor[themeNumber],
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 10.0),
        Center(
          child: SvgPicture.asset(
            imgUrl.toString(),
            height: heightSizeScreen! / 12,
            width: heightSizeScreen! / 12,
          ),
        ),
        SizedBox(width: 10.0),
        Center(
          child: Text(
            title,
            style: styleListView,
          ),
        ),
      ],
    ),
  );
}
