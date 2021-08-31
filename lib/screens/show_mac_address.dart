import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../settings/setting.dart';
import '../main.dart';

class ShowMacAddressScreen extends StatefulWidget {
  const ShowMacAddressScreen({Key? key}) : super(key: key);

  @override
  _ShowMacAddressScreenState createState() => _ShowMacAddressScreenState();
}

class _ShowMacAddressScreenState extends State<ShowMacAddressScreen> {
  String? _deviceId;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String? deviceId = "";
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      deviceId = await PlatformDeviceId.getDeviceId;
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _deviceId = deviceId;
      print("deviceId->$_deviceId");
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widthSizeScreen =  MediaQuery.of(context).size.width.toDouble();
    heightSizeScreen =  MediaQuery.of(context).size.height.toDouble();
    appSetting(MediaQuery.of(context).size.width.toDouble());
    setState(() {});
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
                "assets/images/app_icon.png",
                height: 0.0,
                width: 0.0,
              ),
              showLoader: false,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                color: mainColor[themeNumber],
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
                                  width: widthSizeScreen! / 2,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Center(
                                  child: Text(
                                    _deviceId.toString(),
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
                              "Your Trail Version Will Be Ended In(dd/mm/yyyy)",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
