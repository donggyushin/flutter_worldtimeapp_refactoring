import 'package:flutter/material.dart';
import 'package:timeapp2/choose/choose.dart';
import 'package:timeapp2/components/loading/loading.dart';
import 'package:timeapp2/services/worldTime.dart';

class Home extends StatefulWidget {
  static const RouteName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WorldTimeModel worldTimeModel;
  bool loading = true;
  String bgImage;

  @override
  void initState() {
    super.initState();
    worldTimeModel = WorldTimeModel(
        image: 'south_korean.png', location: 'Seoul', url: 'Asia/Seoul');
    requestWorldTimeModelFetchingData();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Loading();
    } else {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 130,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () {
                        goToChoosePage();
                      },
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.grey[200],
                      ),
                      label: Text(
                        'Go to locations page',
                        style: TextStyle(
                          color: Colors.grey[200],
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 50,
              ),
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
          ),
        ),
      );
    }
  }

  requestWorldTimeModelFetchingData() async {
    await worldTimeModel.fetchingData();
    setState(() {
      loading = false;
      bgImage = worldTimeModel.isDayTime ? 'day.png' : 'night.png';
    });
  }

  goToChoosePage() async {
    WorldTimeModel result =
        await Navigator.pushNamed(context, Choose.RouteName) as WorldTimeModel;
    setState(() {
      worldTimeModel = result;
    });
  }
}
