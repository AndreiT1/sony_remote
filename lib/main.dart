import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:sony_remote/ui/media.dart';
import 'package:sony_remote/ui/volume_channels.dart';
import 'api/bravia_api.dart';
import 'ui/netflix_button.dart';
import 'ui/top_bar.dart';

void main() async {
  //debugPaintSizeEnabled=true;

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  void setRemoteActions() async {
    var connectionStatus = await BraviaAPI.isConnectionSuccesfull();
    if (connectionStatus == true) {
      var remoteControllerInfo = await BraviaAPI.getRemoteControllerInfo();
      BraviaAPI.remoteActions =
          BraviaAPI.getRemoteActions(remoteControllerInfo);
    }
  }

  @override
  Widget build(BuildContext context) {
    setRemoteActions();
    //BraviaAPI.authCoookie();
    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: BoxDecoration(color: Colors.black87),
        child: ListView(
          children: <Widget>[
            TopBar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Netflix(),
              ],
            ),
            VolumeCh(),
            Media()
          ],
        ),
      )),
    );
  }
}
