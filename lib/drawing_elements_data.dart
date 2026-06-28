import 'package:flutter/material.dart';

abstract class Elements {
  Color color;
  double size;
  Elements(this.color, this.size);
}

class Stroke extends Elements {
  List<Offset> points;

  Stroke({required this.points, required Color color, required double size})
    : super(color, size);
}

class CustomShape extends Elements {
  final Offset startPoint;
  final Offset endPoint;
  final String shapeType;
  final bool isFilled;

  CustomShape({
    required this.startPoint,
    required this.endPoint,
    required this.shapeType,
    required this.isFilled,
    required Color color,
    required double size,
  }) : super(color, size);
}

class TextElement extends Elements {
  final String text;

  final Offset startPosition;
  final Offset endPosition;
  TextElement({
    required this.text,
    required this.startPosition,
    required this.endPosition,
    required Color color,
    required double size,
  }) : super(color, size);
}

class EraserElement extends Elements {
  List<Offset> points;

  EraserElement({required this.points, required double size})
    : super(Colors.transparent, size);
}
