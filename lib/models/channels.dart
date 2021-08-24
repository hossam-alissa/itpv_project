import 'package:flutter/material.dart';

enum VideoType {
  asset,
  file,
  network,
}

class Channel {
  String? tvgId;
  String? tvgName;
  String? tvgCountry;
  String? tvgLanguage;
  String? tvgLogo;
  String? groupTitle;
  String? country;
  String? path;
  VideoType? type;

  Channel(
      {required this.tvgId,
      required this.tvgName,
      required this.tvgCountry,
      required this.tvgLanguage,
      required this.tvgLogo,
      required this.groupTitle,
      required this.country,
      required this.path,
      required this.type});
}

class Channels with ChangeNotifier {
  int indexChannelPlayNow = 0;
  List<Channel>? allChannels = [
    Channel(
      tvgId: "AlHurra.us",
      tvgName: "Al Hurra",
      tvgCountry: "US",
      tvgLanguage: "Arabic",
      tvgLogo: "https://i.imgur.com/GRl09vk.jpg",
      groupTitle: "News",
      country: "-",
      path: "https://mbnhls-lh.akamaihd.net/i/MBN_1@118619/master.m3u8",
      type: VideoType.network,
    ),
  ];

  void addChannels(List<String> list) {
    print("----- split -----");
    String? tvgId = "tvgId";
    String? tvgName = "tvgName";
    String? tvgCountry = "tvgCountry";
    String? tvgLanguage = "tvgLanguage";
    String? tvgLogo = "tvgLogo";
    String? groupTitle = "groupTitle";
    String? country = "country";
    String? partOne;
    int indexInfo = 0;
    int indexChannel = 1;

    while (indexInfo < list.length) {
      if (list[indexInfo].contains("#EXTINF:-1 tvg-id=") == true ||
          list[indexInfo].contains(".m3u8") == true) {
      } else {
        print(list[indexInfo]);
        list.removeAt(indexInfo);
      }
      indexInfo = indexInfo + 1;
    }

    indexInfo = 0;
    while (indexChannel < list.length) {
      if (list[indexChannel].contains(".m3u8") == true &&
          list[indexInfo].contains(".m3u8") == false &&
          list[indexInfo].split(",").length > 1) {
        //remove last info step one
        List<String> removeLast;
        try {
          removeLast = list[indexInfo].split(",");
          partOne = removeLast[0];
          //remove "#EXTINF:-1 " step two
          partOne = partOne.replaceRange(0, 10, "");
        } catch (e) {
          partOne = "-";
        }

        try {
          // extract "group-title=" data step three
          removeLast = partOne.split(" group-title=");
          partOne = removeLast[0];
          groupTitle = removeLast[1].replaceAll("\"", "");
        } catch (e) {
          groupTitle = "-";
        }

        try {
          // extract "tvg-logo=" data step 4
          removeLast = partOne!.split(" tvg-logo=");
          partOne = removeLast[0];
          tvgLogo = removeLast[1].replaceAll("\"", "");
        } catch (e) {
          tvgLogo = "-";
        }

        try {
          // extract "tvg-language=" data step 5
          removeLast = partOne!.split(" tvg-language=");
          partOne = removeLast[0];
          tvgLanguage = removeLast[1].replaceAll("\"", "");
        } catch (e) {
          tvgLanguage = "-";
        }

        try {
          // extract " tvg-country=" data step 6
          removeLast = partOne!.split(" tvg-country=");
          partOne = removeLast[0];
          tvgCountry = removeLast[1].replaceAll("\"", "");
        } catch (e) {
          tvgCountry = "-";
        }

        try {
          // extract " tvg-name=" data step 7
          removeLast = partOne!.split(" tvg-name=");
          partOne = removeLast[0];
          tvgName = removeLast[1].replaceAll("\"", "");
        } catch (e) {
          tvgName = "-";
        }

        try {
          // extract " tvg-id=" data step 8
          removeLast = partOne!.split(" tvg-id=");
          partOne = removeLast[0];
          tvgId = removeLast[1].replaceAll("\"", "");
        } catch (e) {
          tvgId = "-";
        }

        // print(partOne);
        // print(
        //     "==tvgid:$tvgId==tvgName:$tvgName==tvgCountry:$tvgCountry==tvglanguage:$tvgLanguage==tvg-logo:$tvgLogo ==group-title:$groupTitle");
        // print(list[indexChannel].trim());
        // print("----- end split -----");

        allChannels!.add(Channel(
          tvgId: tvgId,
          tvgName: tvgName,
          tvgCountry: tvgCountry,
          tvgLanguage: tvgLanguage,
          tvgLogo: tvgLogo.trim(),
          groupTitle: groupTitle,
          country: country,
          path: list[indexChannel].trim(),
          type: VideoType.network,
        ));
        indexInfo = indexInfo + 2;
        indexChannel = indexChannel + 2;
      } else {
        if (list[indexInfo].contains(".m3u8") &&
            list[indexChannel].contains("m3u8")) {
          // print("----- if 1");
          // print(list[indexInfo]);
          // print(list[indexChannel]);
          allChannels!.add(Channel(
            tvgId: "-",
            tvgName: "-",
            tvgCountry: "-",
            tvgLanguage: "-",
            tvgLogo: "-",
            groupTitle: "-",
            country: "-",
            path: list[indexInfo].trim(),
            type: VideoType.network,
          ));
          allChannels!.add(Channel(
            tvgId: "-",
            tvgName: "-",
            tvgCountry: "-",
            tvgLanguage: "-",
            tvgLogo: "-",
            groupTitle: "-",
            country: "-",
            path: list[indexChannel].trim(),
            type: VideoType.network,
          ));
          indexInfo = indexInfo + 2;
          indexChannel = indexChannel + 2;
        } else {
          // print("----- link not working -----");
          // print(list[indexInfo]);
          // print(list[indexChannel]);
          indexInfo = indexInfo + 2;
          indexChannel = indexChannel + 2;
        }
      }
    }
    notifyListeners();
  }
}
