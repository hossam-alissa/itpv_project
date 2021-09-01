import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../settings/setting.dart';
import '../screens/screens.dart';
import 'live_tv_screen.dart';
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
    return Row(
      children: [
        Column(
          children: [
            ///Open File
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
                        UserInformation.setUserInformation();
                        UserInformation.setUserLinks();
                        UserInformation.setFavoriteChannel();

                        Provider.of<Channels>(contextProvider!,listen: false).getListGroupTitle();
                      },
                    ),
                  ],
                ),
              ),
            ),

            ///List View show item
            Expanded(
              child: Container(
                height: double.maxFinite,
                width: widthSizeScreen! / 3,
                color: Colors.white,
                child: ListView(
                  padding: const EdgeInsets.all(0.0),
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                 LiveTvScreen(),
                          ),
                        );
                      },
                      child: listViewItem(
                          "assets/images_svg/live_tv_icon.svg", "LIVE TV"),
                    ),
                    SizedBox(height: spase),
                    GestureDetector(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const MoviesScreen(),
                          ),
                        );
                      },
                      child: listViewItem(
                          "assets/images_svg/movies_icon.svg", "MOVIES"),
                    ),
                    SizedBox(height: spase),
                    GestureDetector(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const SeriesScreen(),
                          ),
                        );
                      },
                      child: listViewItem(
                          "assets/images_svg/series_icon.svg", "SERIES"),
                    ),
                    SizedBox(height: spase),
                    GestureDetector(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const SportsGuideScreen(),
                          ),
                        );
                      },
                      child: listViewItem(
                          "assets/images_svg/sports_guide_icon.svg",
                          "SPORTS GUIDE"),
                    ),
                    SizedBox(height: spase),
                    GestureDetector(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const TvGuideScreen(),
                          ),
                        );
                      },
                      child: listViewItem(
                          "assets/images_svg/tv_guide_icon.svg", "TV GUIDE"),
                    ),
                    SizedBox(height: spase),
                    GestureDetector(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const SettingScreen(),
                          ),
                        );
                      },
                      child: listViewItem(
                          "assets/images_svg/setting_icon.svg", "SETTING"),
                    ),
                    SizedBox(height: spase),
                    GestureDetector(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const PaymentScreen(),
                          ),
                        );
                      },
                      child: listViewItem(
                          "assets/images_svg/pay_premium_version.svg",
                          "Pay Premium Version"),
                    ),
                    SizedBox(height: spase ),
                    // SizedBox(height: spase ),
                  ],
                ),
              ),
            )
          ],
        ),

        ///Show channel info
        Container(
          width: 3,
          color: secondColor[themeNumber],
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 12.0, bottom: 10.0),
            color: mainColor[themeNumber],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Favorite Live TV ", style: styleListView),

                ///Favorite Live Tv
                // Container(
                //   height: heightSizeScreen! / 3,
                //   width: double.maxFinite,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     shrinkWrap: true,
                //     itemCount: Provider.of<Channels>(context, listen: true)
                //         .allChannels!
                //         .length
                //         .toInt(),
                //     itemBuilder: (BuildContext context, int index) {
                //       Channel video =
                //       Provider.of<Channels>(context, listen: true)
                //           .allChannels![index];
                //       return channelView(video, context);
                //     },
                //   ),
                // ),
                Text(
                  "Featured Movies",
                  style: styleListView,
                ),

                ///Featured Movies
                Container(
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
              errorBuilder: (context, error, stackTrace) {
                print("----- error image url not fount -----$error");
                return SvgPicture.asset("assets/images_svg/channel_icon.svg");
              },
            ),
          ),
          Expanded(
              child: Text(
            channel.tvgName.toString(),
            style: styleListView,
            overflow: TextOverflow.ellipsis,
          )),
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
            height: heightSizeScreen! / 16,
            width: heightSizeScreen! / 16,
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
