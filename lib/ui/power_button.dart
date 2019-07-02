import 'package:flutter/material.dart';
import 'package:sony_remote/api/bravia_api.dart';

class PowerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      child: FloatingActionButton(
        backgroundColor: Colors.green,
        child: FittedBox(
          child: IconButton(
            splashColor: Colors.grey,
            iconSize: 30,
            color: Colors.white,
            onPressed: () {
              BraviaAPI.getPowerStatus().then((status) {
                if (status == 'active') {
                  BraviaAPI.setPowerStatus(false);
                } else if (status == 'standby') {
                  BraviaAPI.setPowerStatus(true);
                }
              });
            },
            icon: Icon(
              IconData(0xe905, fontFamily: 'arrow'),
            ),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
