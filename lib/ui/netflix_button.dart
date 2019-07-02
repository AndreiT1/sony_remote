import 'package:flutter/material.dart';
import 'package:sony_remote/api/bravia_api.dart';

class Netflix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
      child: RaisedButton(
        splashColor: Colors.grey,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        onPressed: () => BraviaAPI.sendCommand('Netflix'),
        child: Text(
          'NETFLIX',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontFamily: 'bebas',
          ),
        ),
      ),
      onPressed: () {},
    );
  }
}
