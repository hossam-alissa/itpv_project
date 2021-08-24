import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:itpv_project/setings/setting.dart';

class ShowMacAddressScreen extends StatelessWidget {
  const ShowMacAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){

        },
        child: Container(
          color: mainColor,
          child: Column(
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
                padding: const EdgeInsets.only(top: 15.0,bottom: 10.0,left: 20.0,right: 12.0),
                child: Center(
                  child: Text(
                    "adfasdfasdadfasdfasdadfasdfasdadfas",
                    style: TextStyle(color: Colors.white, fontSize: 20.0,),
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
