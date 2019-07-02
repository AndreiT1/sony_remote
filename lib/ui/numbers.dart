import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sony_remote/api/bravia_api.dart';

class Numbers extends StatelessWidget {
  final List<String> _numbers = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0'
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 2.5,
        padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        children: _numbers.map((String number) {
          return GridTile(
              child: RaisedButton(
                splashColor: Colors.grey,
            color: Colors.black,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            onPressed: () => BraviaAPI.sendCommand('Num' + number),
            child: Text(number,
                style: TextStyle(color: Colors.white, fontSize: 20.0)),
          ));
        }).toList());
  }
}
