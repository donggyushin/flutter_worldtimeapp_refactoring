import 'package:flutter/material.dart';
import 'package:timeapp2/components/loading/loading.dart';
import 'package:timeapp2/services/worldTime.dart';

class Choose extends StatefulWidget {
  static const RouteName = '/choose';

  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  bool loading = false;

  List<WorldTimeModel> locations = [
    WorldTimeModel(url: 'Europe/London', location: 'London', image: 'uk.png'),
    WorldTimeModel(
        url: 'Europe/Berlin', location: 'Athens', image: 'greece.png'),
    WorldTimeModel(url: 'Africa/Cairo', location: 'Cairo', image: 'egypt.png'),
    WorldTimeModel(
        url: 'Africa/Nairobi', location: 'Nairobi', image: 'kenya.png'),
    WorldTimeModel(
        url: 'America/Chicago', location: 'Chicago', image: 'usa.png'),
    WorldTimeModel(
        url: 'America/New_York', location: 'New York', image: 'usa.png'),
    WorldTimeModel(
        url: 'Asia/Seoul', location: 'Seoul', image: 'south_korea.png'),
    WorldTimeModel(
        url: 'Asia/Jakarta', location: 'Jakarta', image: 'indonesia.png'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Loading();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Choose Location",
          ),
          backgroundColor: Colors.blue[900],
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                onTap: () {
                  tileTapped(locations[index]);
                },
                title: Text(
                  locations[index].location,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: CircleAvatar(
                  child: Image(
                    image: AssetImage('assets/${locations[index].image}'),
                  ),
                ),
              ),
            );
          },
          itemCount: locations.length,
        ),
      );
    }
  }

  tileTapped(WorldTimeModel worldTimeModel) async {
    setState(() {
      loading = true;
    });
    await worldTimeModel.fetchingData();
    Navigator.pop(context, worldTimeModel);
  }
}
