import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/drawing_elements_data.dart';

class CustomPainterPen extends CustomPainter {
  List<Elements> strokes;

  final Color toolColor;
  final double toolSize;

  CustomPainterPen(this.strokes, this.toolColor, this.toolSize);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), Paint());

    for (var elements in strokes) {
      final paint = Paint()
        ..color = elements.color
        ..strokeWidth = elements.size
        ..strokeCap = StrokeCap.round;

      if (elements is Stroke) {
        for (int i = 0; i < elements.points.length - 1; i++) {
          canvas.drawLine(elements.points[i], elements.points[i + 1], paint);
        }
      } else if (elements is CustomShape) {
        paint.style = elements.isFilled
            ? PaintingStyle.fill
            : PaintingStyle.stroke;
        if (elements.shapeType == "line") {
          canvas.drawLine(elements.startPoint, elements.endPoint, paint);
        } else if (elements.shapeType == "square") {
          canvas.drawRect(
            Rect.fromPoints(elements.startPoint, elements.endPoint),
            paint,
          );
        } else if (elements.shapeType == "circle") {
          canvas.drawOval(
            Rect.fromPoints(elements.startPoint, elements.endPoint),
            paint,
          );
        } else if (elements.shapeType == "triangle") {
          Path trianglePath = Path()
            ..moveTo(elements.startPoint.dx, elements.endPoint.dy)
            ..lineTo(elements.endPoint.dx, elements.endPoint.dy)
            ..lineTo(
              (elements.startPoint.dx + elements.endPoint.dx) / 2,
              elements.startPoint.dy,
            )
            ..close();

          canvas.drawPath(trianglePath, paint);
        } else if (elements.shapeType == "pentagon") {
          Path pentagonPath = Path()
            ..moveTo(
              (elements.startPoint.dx + elements.endPoint.dx) / 2,
              elements.startPoint.dy,
            )
            ..lineTo(
              elements.endPoint.dx,
              elements.startPoint.dy +
                  (elements.endPoint.dy - elements.startPoint.dy) * 2 / 5,
            )
            ..lineTo(
              elements.startPoint.dx +
                  (elements.endPoint.dx - elements.startPoint.dx) * 4 / 5,
              elements.endPoint.dy,
            )
            ..lineTo(
              elements.startPoint.dx +
                  (elements.endPoint.dx - elements.startPoint.dx) / 5,
              elements.endPoint.dy,
            )
            ..lineTo(
              elements.startPoint.dx,
              elements.startPoint.dy +
                  (elements.endPoint.dy - elements.startPoint.dy) * 2 / 5,
            )
            ..close();

          canvas.drawPath(pentagonPath, paint);
        } else if (elements.shapeType == "hexagon") {
          Path hexagonPath = Path()
            ..moveTo(
              elements.startPoint.dx +
                  (elements.endPoint.dx - elements.startPoint.dx) / 4,
              elements.startPoint.dy,
            )
            ..lineTo(
              elements.startPoint.dx +
                  (elements.endPoint.dx - elements.startPoint.dx) * 3 / 4,
              elements.startPoint.dy,
            )
            ..lineTo(
              elements.endPoint.dx,
              (elements.startPoint.dy + elements.endPoint.dy) / 2,
            )
            ..lineTo(
              elements.startPoint.dx +
                  (elements.endPoint.dx - elements.startPoint.dx) * 3 / 4,
              elements.endPoint.dy,
            )
            ..lineTo(
              elements.startPoint.dx +
                  (elements.endPoint.dx - elements.startPoint.dx) / 4,
              elements.endPoint.dy,
            )
            ..lineTo(
              elements.startPoint.dx,
              (elements.startPoint.dy + elements.endPoint.dy) / 2,
            )
            ..close();

          canvas.drawPath(hexagonPath, paint);
        } else if (elements.shapeType == "star") {
          Path starPath = Path()
            ..moveTo(
              (elements.startPoint.dx + elements.endPoint.dx) / 2,
              elements.startPoint.dy,
            )
            ..lineTo(
              elements.startPoint.dx +
                  (elements.endPoint.dx - elements.startPoint.dx) * 3 / 5,
              elements.startPoint.dy +
                  (elements.endPoint.dy - elements.startPoint.dy) * 2 / 5,
            )
            ..lineTo(
              elements.endPoint.dx,
              elements.startPoint.dy +
                  (elements.endPoint.dy - elements.startPoint.dy) * 2 / 5,
            )
            ..lineTo(
              elements.startPoint.dx +
                  (elements.endPoint.dx - elements.startPoint.dx) * 7 / 10,
              elements.startPoint.dy +
                  (elements.endPoint.dy - elements.startPoint.dy) * 3 / 5,
            )
            ..lineTo(
              elements.startPoint.dx +
                  (elements.endPoint.dx - elements.startPoint.dx) * 4 / 5,
              elements.endPoint.dy,
            )
            ..lineTo(
              (elements.startPoint.dx + elements.endPoint.dx) / 2,
              elements.startPoint.dy +
                  (elements.endPoint.dy - elements.startPoint.dy) * 4 / 5,
            )
            ..lineTo(
              elements.startPoint.dx +
                  (elements.endPoint.dx - elements.startPoint.dx) / 5,
              elements.endPoint.dy,
            )
            ..lineTo(
              elements.startPoint.dx +
                  (elements.endPoint.dx - elements.startPoint.dx) * 3 / 10,
              elements.startPoint.dy +
                  (elements.endPoint.dy - elements.startPoint.dy) * 3 / 5,
            )
            ..lineTo(
              elements.startPoint.dx,
              elements.startPoint.dy +
                  (elements.endPoint.dy - elements.startPoint.dy) * 2 / 5,
            )
            ..lineTo(
              elements.startPoint.dx +
                  (elements.endPoint.dx - elements.startPoint.dx) * 2 / 5,
              elements.startPoint.dy +
                  (elements.endPoint.dy - elements.startPoint.dy) * 2 / 5,
            )
            ..close();

          canvas.drawPath(starPath, paint);
        } else if (elements.shapeType == "star") {
          final double width = elements.endPoint.dx - elements.startPoint.dx;
          final double height = elements.endPoint.dy - elements.startPoint.dy;

          Path path = Path();

          path.moveTo(
            elements.startPoint.dx + width / 2,
            elements.startPoint.dy,
          );

          path.lineTo(
            elements.startPoint.dx + width * 3.1 / 5,
            elements.startPoint.dy + height * 2 / 5,
          );

          path.lineTo(
            elements.startPoint.dx + width,
            elements.startPoint.dy + height * 2 / 5,
          );

          path.lineTo(
            elements.startPoint.dx + width * 3.5 / 5,
            elements.startPoint.dy + height * 3 / 5,
          );

          path.lineTo(
            elements.startPoint.dx + width * 4 / 5,
            elements.startPoint.dy + height,
          );

          path.lineTo(
            elements.startPoint.dx + width / 2,
            elements.startPoint.dy + height * 4 / 5,
          );

          path.lineTo(
            elements.startPoint.dx + width / 5,
            elements.startPoint.dy + height,
          );

          path.lineTo(
            elements.startPoint.dx + width * 1.5 / 5,
            elements.startPoint.dy + height * 3 / 5,
          );

          path.lineTo(
            elements.startPoint.dx,
            elements.startPoint.dy + height * 2 / 5,
          );

          path.lineTo(
            elements.startPoint.dx + width * 1.9 / 5,
            elements.startPoint.dy + height * 2 / 5,
          );

          path.close();

          canvas.drawPath(path, paint);
        }
      } else if (elements is TextElement) {
        final TextElement textElement = elements;

        double left = textElement.startPosition.dx < textElement.endPosition.dx
            ? textElement.startPosition.dx
            : textElement.endPosition.dx;
        double top = textElement.startPosition.dy < textElement.endPosition.dy
            ? textElement.startPosition.dy
            : textElement.endPosition.dy;
        double width =
            (textElement.endPosition.dx - textElement.startPosition.dx).abs();
        double height =
            (textElement.endPosition.dy - textElement.startPosition.dy).abs();

        if (width < 30) width = 30;
        if (height < 30) height = 30;

        Rect boxRect = Rect.fromLTWH(left, top, width, height);

        if (textElement.text.isEmpty) {
          final rectPaint = Paint()
            ..color = Colors.grey
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.5;
          canvas.drawRect(boxRect, rectPaint);
        } else {
          final textSpan = TextSpan(
            text: textElement.text,
            style: TextStyle(color: textElement.color, fontSize: 24),
          );
          final textPainter = TextPainter(
            text: textSpan,
            textDirection: TextDirection.ltr,
          );
          textPainter.layout(minWidth: 0, maxWidth: width);
          textPainter.paint(canvas, Offset(left, top));
        }
      } else if (elements is EraserElement) {
        final EraserElement eraserElement = elements;
        final eraserPaint = Paint()
          ..blendMode = BlendMode.clear
          ..strokeWidth = eraserElement.size
          ..strokeCap = StrokeCap.round;
        for (int i = 0; i < eraserElement.points.length - 1; i++) {
          canvas.drawLine(
            eraserElement.points[i],
            eraserElement.points[i + 1],
            eraserPaint,
          );
        }
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomPainterEraser extends CustomPainter {
  final List<Offset> eraserPoints;

  CustomPainterEraser(this.eraserPoints);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), Paint());

    Paint eraserPaint = Paint()
      ..blendMode = BlendMode.clear
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < eraserPoints.length - 1; i++) {
      canvas.drawLine(eraserPoints[i], eraserPoints[i + 1], eraserPaint);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainterEraser oldDelegate) {
    return true;
  }
}
