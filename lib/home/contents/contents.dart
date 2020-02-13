import 'package:flutter/material.dart';
import 'package:timeapp2/services/worldTime.dart';

class Contents extends StatefulWidget {
  final WorldTimeModel worldTimeModel;

  Contents({@required this.worldTimeModel});

  @override
  _ContentsState createState() =>
      _ContentsState(worldTimeModel: worldTimeModel);
}

class _ContentsState extends State<Contents> {
  WorldTimeModel worldTimeModel;

  _ContentsState({@required this.worldTimeModel});

  @override
  Widget build(BuildContext context) {
    print("asd");
    return Column(
      children: <Widget>[
        Text(
          worldTimeModel.location,
          style: TextStyle(
            fontSize: 30,
            letterSpacing: 1.4,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          worldTimeModel.time,
          style: TextStyle(
            fontSize: 70,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
