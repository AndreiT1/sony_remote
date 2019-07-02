import 'package:flutter/material.dart';
import 'package:sony_remote/ui/numbers.dart';

class AnimateNumbers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AnimateNumbers();
  }
}

class _AnimateNumbers extends State<AnimateNumbers> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      child: Numbers(),
    );
  }
}
