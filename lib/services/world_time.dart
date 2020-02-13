import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name from the ui
  String time; //time in that location
  String flag; //country flag asset icon
  String url; //location url for api endpoint
  bool isDayTime; //boolean variable

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {
    try {
      //getting data from api
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //getting data from data map
      String datetime = data['datetime'];
      String utc_offset = data['utc_offset'].substring(1, 3);

      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(utc_offset)));

      //set the time property
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: ${e}');
      time = 'could not get time data';
    }
  }
}

