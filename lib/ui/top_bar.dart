import 'package:flutter/material.dart';
import 'package:sony_remote/api/bravia_api.dart';
import 'package:sony_remote/ui/joystick.dart';
import 'package:sony_remote/ui/numbers.dart';
import 'package:sony_remote/ui/power_button.dart';

class TopBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TopBar();
  }
}

class _TopBar extends State<TopBar> {
  bool _first = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
      child: ListView(shrinkWrap: true, children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ButtonTheme(
              minWidth: 15.0,
              child: RaisedButton(
                splashColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.black,
                onPressed: () {
                  BraviaAPI.sendCommand('Input');
                },
                child: Text(
                  'SOURCE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            ButtonTheme(
              minWidth: 10,
              height: 25,
              child: RaisedButton(
                splashColor: Colors.grey,
                onPressed: () {
                  setState(() {
                    _first = !_first;
                  });
                },
                child: Text(
                  '?123',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 50.0,
            ),
            PowerButton()
          ],
        ),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 500),
          firstChild: Joystick(),
          secondChild: Numbers(),
          crossFadeState:
              _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        )
      ]),
    );
  }
}
