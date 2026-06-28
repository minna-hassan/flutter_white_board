import 'package:flutter/material.dart';

class CanvasBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var Size(:width, :height) = size;

    final backgroundPainter = Paint()
      ..color = Color.fromARGB(255, 255, 255, 255);

    canvas.drawRect(Rect.fromLTWH(0, 0, width, height), backgroundPainter);
    final horizontalLines = Paint()
      ..style = PaintingStyle.stroke
      ..color = const Color.fromARGB(180, 239, 243, 248);
    for (double i = 0; i < size.width; i += 25) {
      canvas.drawLine(Offset(i, 0), Offset(i, height), horizontalLines);
    }
    final verticalLines = Paint()
      ..style = PaintingStyle.stroke
      ..color = const Color.fromARGB(180, 239, 243, 248);
    for (double i = 0; i < size.height; i += 25) {
      canvas.drawLine(Offset(0, i), Offset(width, i), verticalLines);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
