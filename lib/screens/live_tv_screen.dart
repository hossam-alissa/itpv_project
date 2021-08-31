import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../screens/screens.dart';
import '../settings/setting.dart';

class LiveTvScreen extends StatefulWidget {
  @override
  _LiveTvScreenState createState() => _LiveTvScreenState();
}

class _LiveTvScreenState extends State<LiveTvScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Channels>(contextProvider!, listen: false).channelGroupTitle =
        Provider.of<Channels>(contextProvider!, listen: false).allChannels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
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
                    children: <Widget>[],
                  ),
                ),
              ),
              Container(
                height: heightSizeScreen! / 8,
                width: widthSizeScreen! / 3,
                color: secondColor[themeNumber],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "LIVE TV",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold),
                    ),
                    SvgPicture.asset(
                      "assets/images_svg/movies_icon.svg",
                      height: heightSizeScreen! / 12,
                      width: heightSizeScreen! / 12,
                    ),
                    SizedBox(
                      width: 8.0,
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ChannelSearchingScreen()));
                },
                child: Container(
                  height: heightSizeScreen! / 10,
                  width: widthSizeScreen! / 3,
                  color: Colors.white,
                  child: Row(
                    children: [
                      SizedBox(width: 10.0),
                      Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                      ),
                      Text("Search ..."),
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
                      ///All Channels
                      GestureDetector(
                        onTap: () {
                          print("----- All Channels -----");
                          Provider.of<Channels>(contextProvider!,
                                  listen: false)
                              .getChannelGroupTitle("All Channels");
                          setState(() {});
                        },
                        child: listViewItem("", "All Channels"),
                      ),
                      SizedBox(height: spase),

                      ///Favorites
                      GestureDetector(
                        onTap: () {},
                        child: listViewItem("Favorite", "Favorite TV"),
                      ),
                      SizedBox(height: spase),

                      ///News
                      GestureDetector(
                        onTap: () {
                          print("----- News -----");
                          Provider.of<Channels>(contextProvider!,
                                  listen: false)
                              .getChannelGroupTitle("News");
                          setState(() {});
                        },
                        child: listViewItem("News", "News"),
                      ),
                      SizedBox(height: spase),

                      ///Religious
                      GestureDetector(
                        onTap: () {
                          print("----- Religious -----");
                          Provider.of<Channels>(contextProvider!,
                                  listen: false)
                              .getChannelGroupTitle("Religious");
                          setState(() {});
                        },
                        child: listViewItem("Religious", "Religious"),
                      ),
                      SizedBox(height: spase),

                      ///Sports
                      GestureDetector(
                        onTap: () {
                          print("----- Sports -----");
                          Provider.of<Channels>(contextProvider!,
                                  listen: false)
                              .getChannelGroupTitle("Sports");
                          setState(() {});
                        },
                        child: listViewItem("Sports", "Sports"),
                      ),
                      SizedBox(height: spase),

                      ///Kids
                      GestureDetector(
                        onTap: () {
                          print("----- Kids -----");
                          Provider.of<Channels>(contextProvider!,
                                  listen: false)
                              .getChannelGroupTitle("Kids");
                          setState(() {});
                        },
                        child: listViewItem("Kids", "Kids"),
                      ),
                      SizedBox(height: spase),

                      ///General
                      GestureDetector(
                        onTap: () {
                          print("----- General -----");
                          Provider.of<Channels>(contextProvider!,
                                  listen: false)
                              .getChannelGroupTitle("General");
                          setState(() {});
                        },
                        child: listViewItem("General", "General"),
                      ),
                      SizedBox(height: spase),

                      ///Documentary
                      GestureDetector(
                        onTap: () {
                          print("----- Documentary -----");
                          Provider.of<Channels>(contextProvider!,
                                  listen: false)
                              .getChannelGroupTitle("Documentary");
                          setState(() {});
                        },
                        child: listViewItem("Documentary", "Documentary"),
                      ),
                      SizedBox(height: spase),

                      ///Classic
                      GestureDetector(
                        onTap: () {
                          print("----- Classic -----");
                          Provider.of<Channels>(contextProvider!,
                              listen: false)
                              .getChannelGroupTitle("Classic");
                          setState(() {});
                        },
                        child: listViewItem("Classic", "Classic"),
                      ),
                      SizedBox(height: spase),

                      ///Travel
                      GestureDetector(
                        onTap: () {
                          print("----- Travel -----");
                          Provider.of<Channels>(contextProvider!,
                              listen: false)
                              .getChannelGroupTitle("Travel");
                          setState(() {});
                        },
                        child: listViewItem("Travel", "Travel"),
                      ),
                      SizedBox(height: spase),

                      ///Movies
                      GestureDetector(
                        onTap: () {
                          print("----- Movies -----");
                          Provider.of<Channels>(contextProvider!,
                              listen: false)
                              .getChannelGroupTitle("Movies");
                          setState(() {});
                        },
                        child: listViewItem("Movies", "Movies"),
                      ),
                      SizedBox(height: spase),
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
                  //     itemCount: Provider.of<Channels>(contextProvider, listen: true)
                  //         .allChannels!
                  //         .length
                  //         .toInt(),
                  //     itemBuilder: (BuildContext context, int index) {
                  //       Channel video =
                  //       Provider.of<Channels>(contextProvider, listen: true)
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
                      itemCount: Provider.of<Channels>(contextProvider!,
                              listen: true)
                          .channelGroupTitle!
                          .length
                          .toInt(),
                      itemBuilder: (BuildContext context, int index) {
                        Channel video = Provider.of<Channels>(
                                contextProvider!,
                                listen: true)
                            .channelGroupTitle![index];
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
  String groupTitle,
  String title,
) {
  return Container(
    height: heightSizeScreen! / 11,
    color: mainColor[themeNumber],
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 25.0),
        Center(
          child: Text(
            title,
            style: styleListView,
          ),
        ),
        Expanded(child: SizedBox(width: 25.0)),
        Center(
          child: Text(
            title == "All Channels"
                ? Provider.of<Channels>(contextProvider!, listen: false)
                    .allChannels!
                    .length
                    .toString()
                : Provider.of<Channels>(contextProvider!, listen: false)
                    .getGroupTitleNumber(groupTitle)
                    .toString(),
            style: styleListView,
          ),
        ),
        SizedBox(width: 20.0)
      ],
    ),
  );
}
