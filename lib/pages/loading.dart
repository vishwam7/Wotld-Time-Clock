import 'package:flutter/material.dart';
import 'package:worldtime/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {

  void WorldTimeSetup() async{
    WorldTime wt = WorldTime(location: 'India',flag: 'India.png',url: 'Asia/Kolkata');
    await wt.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': wt.location,
      'flag': wt.flag,
      'time':wt.time,
      'dayOrNight' : wt.dayOrNight,
    });
  }
  @override
  void initState(){
    super.initState();
    WorldTimeSetup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );

  }
}
