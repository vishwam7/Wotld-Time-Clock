import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart';

class WorldTime{
  String location;
  String time;
  String flag;
  String url;
  bool dayOrNight;

  WorldTime({this.location,this.flag,this.url});

  Future <void> getTime() async{

    Response response = await get('https://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);

    String datetime = data['datetime'];
    String offset_hr = data['utc_offset'].substring(0,3);
    String offset_min = data['utc_offset'].substring(4,);
    DateTime dt = DateTime.parse(datetime);
    print(dt);
    dt=dt.add(Duration(hours: int.parse(offset_hr),minutes: int.parse(offset_min)));

    dayOrNight = dt.hour > 6 && dt.hour < 18 ? true : false ;
    time = DateFormat.jm().format(dt);
    print(time);
  }

}