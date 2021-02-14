import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

const apikey = '5ff866cbb1eea98d2c841e0848a9d43c';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }
  
  void getData() async {
    Response response = await get('https://api.openweathermap.org/data/2.5/'
        'weather?lat=$latitude&lon=$longitude&appid=$apikey');
    String data = response.body;


    var temperature = jsonDecode(data)['main']['temp'];
    var condition = jsonDecode(data)['weather'][0]['id'];
    var cityname = jsonDecode(data)['name'];
  }
void getLocation() async {
  Location location = Location();
  await location.getCurrentlocation();
  latitude = location.latitude;
  longitude = location.longitude;

  getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold();
        }
}
