import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../settings/setting.dart';
import '../widgets/responsive.dart';
import '../main.dart';

class ShowMacAddressScreen extends StatefulWidget {
  const ShowMacAddressScreen({Key? key}) : super(key: key);

  @override
  _ShowMacAddressScreenState createState() => _ShowMacAddressScreenState();
}

class _ShowMacAddressScreenState extends State<ShowMacAddressScreen> {
  Widget _mobile() {
    return Container(
      color: mainColor,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Center(
                      child: SvgPicture.asset(
                    "assets/images_svg/mac_address.svg",
                    // height: 70.0,
                    width: 275.0,
                  )),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Center(
                        child: Text(
                      "ad15fdsa3",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 10.0, left: 20.0, right: 12.0),
                child: Center(
                  child: Text(
                    "adfasdfasdadfasdfasdadfasdfasdadfas",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _desktop() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            EasySplashScreen(
              durationInSeconds: 2,
              navigator: MyApp(),
              logo: Image.asset(
                "assets/images/splash_screen.png",
                height: 0.0,
                width: 0.0,
              ),
              showLoader: false,
            ),
            GestureDetector(
              onTap: () {},
              child: Responsive(
                mobile: _mobile(),
                tablet: _mobile(),
                desktop: _desktop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
