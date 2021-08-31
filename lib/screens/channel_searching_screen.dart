import 'package:flutter/material.dart';
import 'package:itpv_project/settings/setting.dart';

class ChannelSearchingScreen extends StatefulWidget {
  const ChannelSearchingScreen({Key? key}) : super(key: key);

  @override
  _ChannelSearchingScreenState createState() => _ChannelSearchingScreenState();
}

class _ChannelSearchingScreenState extends State<ChannelSearchingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: mainColor[themeNumber],
      ),
    );
  }
}
