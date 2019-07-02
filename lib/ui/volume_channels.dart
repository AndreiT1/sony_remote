import 'package:flutter/material.dart';
import 'package:sony_remote/api/bravia_api.dart';

class VolumeCh extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VolumeCh();
  }
}

class _VolumeCh extends State<VolumeCh> {
  Icon iconVolumeStatus = Icon(
    Icons.volume_off,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(
                Icons.volume_up,
                color: Colors.white,
              ),
              ButtonTheme(
                minWidth: 60.0,
                height: 85.0,
                child: RaisedButton(
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                  onPressed: () => BraviaAPI.sendCommand('VolumeUp'),
                ),
              ),
              ButtonTheme(
                minWidth: 60.0,
                height: 85.0,
                child: RaisedButton(
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 60, color: Colors.white),
                  ),
                  onPressed: () => BraviaAPI.sendCommand('VolumeDown'),
                ),
              )
            ],
          ),
          Container(
            child: Center(
                child: ButtonTheme(
              minWidth: 10.0,
              height: 30.0,
              child: RaisedButton(
                  splashColor: Colors.grey,
                  color: Colors.black,
                  onPressed: () {
                    BraviaAPI.sendCommand('Mute');
                  },
                  child: iconVolumeStatus),
            )),
          ),
          Column(
            children: <Widget>[
              Text(
                'PROG',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              ButtonTheme(
                minWidth: 60.0,
                height: 85.0,
                child: RaisedButton(
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                  onPressed: () => BraviaAPI.sendCommand('ChannelUp'),
                ),
              ),
              ButtonTheme(
                minWidth: 60.0,
                height: 85.0,
                child: RaisedButton(
                  splashColor: Colors.grey,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 60, color: Colors.white),
                  ),
                  onPressed: () => BraviaAPI.sendCommand('ChannelDown'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
