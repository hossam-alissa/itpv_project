import 'dart:convert';

import 'package:http/http.dart' as http;

class UserInformation{
  static String? androidId;
  static String? date;

  static setUserInformation()async{
    try{
      final String url = 'https://mxiptv-f1fa9-default-rtdb.firebaseio.com/user_inforamtion.json';

      http.Response res = await http.post(Uri.parse(url),
          body: json.encode({
            'andoridId': "00000".toString(),
            'pre': "pre".toString(),
            'dateEnd': "dateEnd".toString(),
          }));
      print("----- Done setUserInformation -----");
    }catch(error){
      print("----- Error setUserInformation -----");
      print(error);
    }
  }

  static setUserLinks()async{
    try{
      final String url = 'https://mxiptv-f1fa9-default-rtdb.firebaseio.com/user_links.json';

      http.Response res = await http.post(Uri.parse(url),
          body: json.encode({
            'andoridId': "00000".toString(),
            'link': "pre".toString(),
          }));
      print("----- Done setUserLinks -----");
    }catch(error){
      print("----- Error setUserLinks -----");
      print(error);
    }
  }

  static setFavoriteChannel()async{
    try{
      final String url = 'https://mxiptv-f1fa9-default-rtdb.firebaseio.com/favorite_channel.json';

      http.Response res = await http.post(Uri.parse(url),
          body: json.encode({
            'andoridId': "00000".toString(),
            'link': "pre".toString(),
          }));
      print("----- Done setFavoriteChannel -----");
    }catch(error){
      print("----- Error setFavoriteChannel -----");
      print(error);
    }
  }

  static deleteFavoriteChannel()async{
    try{
      // final String url = 'https://mxiptv-f1fa9-default-rtdb.firebaseio.com/favorite_channel.json';
      //
      // http.Response res = await http.post(Uri.parse(url),
      //     body: json.encode({
      //       'andoridId': "00000".toString(),
      //       'link': "pre".toString(),
      //     }));
      print("----- Done deleteFavoriteChannel -----");
    }catch(error){
      print("----- Error deleteFavoriteChannel -----");
      print(error);
    }
  }
}