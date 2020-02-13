import 'package:flutter/material.dart';

class RedirectButton extends StatelessWidget {
  final Function goToChoosePage;

  RedirectButton({@required this.goToChoosePage});

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
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
        ));
  }
}
