import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  /// the [button] is typically an [IconButton]
  /// but can be replaced with relevant [Widget]
  /// like a [CircularProgressIndicator]
  final Widget button;
  final Color color;
  final double size;
  final double elevation;

  const CircularIconButton(
      {Key key,
      @required this.button,
      @required this.color,
      this.size = 48.0,
      this.elevation = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      shape: CircleBorder(),
      child: Container(
          height: size,
          width: size,
          child: button,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
    );
  }
}
