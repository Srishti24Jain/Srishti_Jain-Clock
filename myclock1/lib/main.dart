import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  HomeScreenState();
  _currentTime() {
    var day = DateTime.now().day.toInt();
    const Months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    var month = Months[DateTime.now().month.toInt() - 1];
    var year = DateTime.now().year.toInt();
    return "$month $day,$year";
  }

  _currentTime1() {
    return "${DateTime.now().hour}:${DateTime.now().minute}";
  }

  _currentTime2() {
    const Weeks = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];
    var weekday = Weeks[DateTime.now().weekday.toInt() - 1];

    return "$weekday";
  }
@override
void initState(){
Timer.periodic(Duration(seconds:1),(V){
    if(mounted){
      setState((){
        _currentTime();
        _currentTime1();
        _currentTime2();

      });
    }
  });
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CLOCK",
      color: Colors.red,
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          elevation: 20.0,
          backgroundColor: Colors.blueGrey,
          title: Center(
            child: Text(
              'CLOCK',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Container(
            child: Stack(
          children: <Widget>[
            Container(
              height: 400.0,
              padding: EdgeInsets.only(left: 200, right: 200),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 15.0,
                    spreadRadius: 15.0,
                    offset: Offset(4, 4),
                  ),
                ],
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.blue, Colors.black]),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54.withOpacity(0.2),
                      spreadRadius: 8,
                      blurRadius: 2,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: Image.asset(
                  "1.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 421,
              child: Container(
                child: Text(
                  _currentTime(),
                  style: TextStyle(
                    fontSize: 29.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              right: 65,
              child: Container(
                margin: EdgeInsets.only(right: 190),
                child: Text(
                  _currentTime1(),
                  style: TextStyle(
                    fontSize: 55.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 10,
              child: Container(
                child: Text(
                  _currentTime2(),
                  style: TextStyle(
                    fontSize: 29.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
