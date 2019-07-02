import 'package:flutter/material.dart';
import 'package:sony_remote/api/bravia_api.dart';

class Media extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ButtonTheme(
                minWidth: 30.0,
                height: 40.0,
                child: RaisedButton.icon(
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  onPressed: () => BraviaAPI.sendCommand('Prev'),
                  icon: Icon(Icons.fast_rewind, color: Colors.white),
                  label: Text(''),
                ),
              ),
              ButtonTheme(
                minWidth: 100.0,
                height: 40.0,
                child: RaisedButton.icon(
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  onPressed: () => BraviaAPI.sendCommand('Play'),
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                  label: Text(''),
                ),
              ),
              ButtonTheme(
                minWidth: 30.0,
                height: 40.0,
                child: RaisedButton.icon(
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  onPressed: () => BraviaAPI.sendCommand('Next'),
                  icon: Icon(
                    Icons.fast_forward,
                    color: Colors.white,
                  ),
                  label: Text(''),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ButtonTheme(
                minWidth: 40.0,
                height: 40.0,
                child: RaisedButton.icon(
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  onPressed: () => BraviaAPI.sendCommand('Prev'),
                  icon: Icon(
                    Icons.fast_rewind,
                    color: Colors.white,
                  ),
                  label: Text(''),
                ),
              ),
              ButtonTheme(
                minWidth: 40.0,
                height: 40.0,
                child: RaisedButton.icon(
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  onPressed: () => BraviaAPI.sendCommand('Pause'),
                  icon: Icon(
                    Icons.pause,
                    color: Colors.white,
                  ),
                  label: Text(''),
                ),
              ),
              ButtonTheme(
                minWidth: 40.0,
                height: 40.0,
                child: RaisedButton.icon(
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  onPressed: () => BraviaAPI.sendCommand('Stop'),
                  icon: Icon(
                    Icons.stop,
                    color: Colors.white,
                  ),
                  label: Text(''),
                ),
              ),
              ButtonTheme(
                minWidth: 40.0,
                height: 40.0,
                child: RaisedButton.icon(
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  onPressed: () => BraviaAPI.sendCommand('Next'),
                  icon: Icon(
                    Icons.fast_forward,
                    color: Colors.white,
                  ),
                  label: Text(''),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
