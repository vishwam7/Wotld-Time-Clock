import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override

  Widget build(BuildContext context) {

    data= data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgimg = data['dayOrNight'] ? 'day1.jpg' : 'night2.jpg';
    Color bgcolor = data['dayOrNight'] ? Colors.lightBlueAccent[100] : Colors.black;
    Color txcolor = data['dayOrNight'] ? Colors.black54 : Colors.white;
    print(data);
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/$bgimg'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,150,0,0),
            child: Column(
              children: [
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time' : result['time'],
                          'location' : result['location'],
                          'flag' : result['flag'],
                          'dayOrNight' : result['dayOrNight'],
                        };
                      });
                    },
                    icon:Icon (
                      Icons.edit_location,
                      color: txcolor,
                      ),
                    label: Text('Change Location',
                    style: TextStyle(
                      color: txcolor,
                    ),
                    )),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 35.0,
                        letterSpacing: 2.0,
                        color: txcolor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    letterSpacing: 2.0,
                    color: txcolor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
