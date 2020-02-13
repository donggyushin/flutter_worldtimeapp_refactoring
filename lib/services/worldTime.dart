import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WorldTimeModel {
  String url;
  String image;
  bool isDayTime;
  String location;
  String time;

  WorldTimeModel({
    @required this.image,
    @required this.location,
    @required this.url,
  });

  fetchingData() async {
    http.Response response =
        await http.get('http://worldtimeapi.org/api/timezone/$url');
    final body = json.decode(response.body);
    DateTime dateTime = DateTime.parse(body['datetime']);
    int offset = int.parse(body['utc_offset'].toString().substring(1, 3));
    dateTime = dateTime.add(Duration(hours: offset));
    time = DateFormat.jm().format(dateTime);
    isDayTime = dateTime.hour > 6 && dateTime.hour < 20 ? true : false;
  }
}
