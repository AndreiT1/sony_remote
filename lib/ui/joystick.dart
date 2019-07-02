import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sony_remote/api/bravia_api.dart';

class Joystick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                splashColor: Colors.black,
                alignment: Alignment.center,
                iconSize: 70,
                color: Colors.white,
                onPressed: () => BraviaAPI.sendCommand('Up'),
                icon: Icon(
                  IconData(0xe901, fontFamily: 'arrow'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                splashColor: Colors.black,
                iconSize: 70,
                color: Colors.white,
                onPressed: () => BraviaAPI.sendCommand('Left'),
                icon: Icon(
                  IconData(0xe900, fontFamily: 'arrow'),
                ),
              ),
              SizedBox(
                width: 0.0,
              ),
              IconButton(
                splashColor: Colors.black,
                iconSize: 50,
                color: Colors.white,
                onPressed: () => BraviaAPI.sendCommand('Confirm'),
                icon: Icon(
                  IconData(0xe904, fontFamily: 'arrow'),
                ),
              ),
              IconButton(
                splashColor: Colors.black,
                iconSize: 70,
                color: Colors.white,
                onPressed: () => BraviaAPI.sendCommand('Right'),
                icon: Icon(
                  IconData(0xe902, fontFamily: 'arrow'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 27.0,
              ),
              ButtonTheme(
                minWidth: 10.0,
                buttonColor: Colors.black,
                child: RaisedButton(
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'RETURN',
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                  onPressed: () => BraviaAPI.sendCommand('Return'),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              IconButton(
                splashColor: Colors.black,
                iconSize: 70,
                color: Colors.white,
                onPressed: () => BraviaAPI.sendCommand('Down'),
                icon: Icon(
                  IconData(0xe903, fontFamily: 'arrow'),
                ),
              ),
              SizedBox(
                width: 12.0,
              ),
              ButtonTheme(
                minWidth: 10.0,
                buttonColor: Colors.black,
                child: RaisedButton(
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'HOME',
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                  onPressed: () => BraviaAPI.sendCommand('Home'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
