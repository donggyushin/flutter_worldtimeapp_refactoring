import 'package:flutter/material.dart';
import 'package:timeapp2/choose/choose.dart';
import 'package:timeapp2/home/home.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      routes: {
        Home.RouteName: (context) => Home(),
        Choose.RouteName: (context) => Choose(),
      },
    ));
