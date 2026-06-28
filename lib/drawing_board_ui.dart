import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/drawing_elements_data.dart';
import 'package:flutter_drawing_board/custom_app_bar.dart';
import 'package:flutter_drawing_board/canvas_background.dart';
import 'package:flutter_drawing_board/custom_painter.dart';
import 'package:flutter_drawing_board/tool_box.dart';

class DrawingBoard extends StatefulWidget {
  const DrawingBoard({super.key});

  @override
  State<DrawingBoard> createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {
  double selectedTool = 1;
  Color selectedColor = Colors.black;
  double selectedPenSize = 2.30;
  int selectedPen = 1;
  String currentText = "";
  double counter = 100;
  String shapeType = "rect";
  bool isfilled = false;
  bool showProperties = false;
  bool isShapeActive = false;
  double activeDrawingTool = 1;
  List<Elements> redoPoints = [];
  List<Elements> points = [];

  bool askForText = false;
  TextEditingController textPromptController = TextEditingController();
  void changeColour(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  void onTextChanged(String text) {
    setState(() {
      currentText = text;
      if (activeDrawingTool == 7 &&
          points.isNotEmpty &&
          points.last is TextElement) {
        var lastText = points.last as TextElement;
        points[points.length - 1] = TextElement(
          startPosition: lastText.startPosition,
          endPosition: lastText.endPosition,
          text: currentText,
          color: lastText.color,
          size: lastText.size,
        );
      }
    });
  }

  void onClear(bool isClear) {
    setState(() {
      if (isClear == true) {
        points.clear();
      }
    });
  }

  void changeTool(double tool) {
    setState(() {
      selectedTool = tool;
      showProperties = true;
      if (tool == 1 || tool == 5 || tool == 7 || tool == 8) {
        activeDrawingTool = tool;
      }
      if (tool == 1) {
        isShapeActive = false;
      } else if (tool == 5) {
        isShapeActive = true;
      }
    });
  }

  void changePenSize(double size) {
    setState(() {
      selectedPenSize = size;
    });
  }

  void onZoomIn() {
    setState(() {
      if (counter < 200) {
        counter += 10;
      }
    });
  }

  void onShapeChange(String shape, bool isFilled) {
    setState(() {
      shapeType = shape;
      isfilled = isFilled;
    });
  }

  void onZoomOut() {
    setState(() {
      if (counter > 10) {
        counter -= 10;
      }
    });
  }

  void undo() {
    if (points.isNotEmpty) {
      setState(() {
        redoPoints.add(points.removeLast());
      });
    }
  }

  void redo() {
    if (redoPoints.isNotEmpty) {
      setState(() {
        points.add(redoPoints.removeLast());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.widthOf(context);
    var screenHeight = MediaQuery.heightOf(context);

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (showProperties) {
              setState(() {
                showProperties = false;
              });
            }
          },
          onPanStart: (details) {
            setState(() {
              if (showProperties && activeDrawingTool != 7) {
                showProperties = false;
              }
              if (activeDrawingTool == 7) {
                points.add(
                  TextElement(
                    startPosition: details.localPosition,
                    endPosition: details.localPosition,
                    text: "",
                    color: selectedColor,
                    size: selectedPenSize,
                  ),
                );
              } else if (activeDrawingTool == 8) {
                points.add(
                  EraserElement(
                    points: [details.localPosition],
                    size: selectedPenSize * 5,
                  ),
                );
              } else if (isShapeActive) {
                points.add(
                  CustomShape(
                    startPoint: details.localPosition,
                    endPoint: details.localPosition,
                    isFilled: isfilled,
                    shapeType: shapeType,
                    color: selectedColor,
                    size: selectedPenSize,
                  ),
                );
              } else {
                points.add(
                  Stroke(
                    points: [details.localPosition],
                    color: selectedColor,
                    size: selectedPenSize,
                  ),
                );
              }
            });
          },
          onPanUpdate: (details) {
            setState(() {
              if (points.isEmpty) return;
              if (activeDrawingTool == 7) {
                var last = points.last;

                if (last is TextElement) {
                  points[points.length - 1] = TextElement(
                    startPosition: last.startPosition,
                    endPosition: details.localPosition,
                    text: last.text,
                    color: last.color,
                    size: last.size,
                  );
                }
              } else if (activeDrawingTool == 8) {
                var lastElement = points.last;
                if (lastElement is EraserElement) {
                  lastElement.points.add(details.localPosition);
                }
              } else if (isShapeActive) {
                var lastElement = points.last;

                if (lastElement is CustomShape) {
                  points[points.length - 1] = CustomShape(
                    color: selectedColor,
                    size: selectedPenSize,
                    startPoint: lastElement.startPoint,
                    endPoint: details.localPosition,
                    shapeType: lastElement.shapeType,
                    isFilled: lastElement.isFilled,
                  );
                }
              } else {
                var lastElement = points.last;
                if (lastElement is Stroke) {
                  lastElement.points.add(details.localPosition);
                }
              }
            });
          },
          onPanEnd: (details) {
            if (activeDrawingTool == 7 &&
                points.isNotEmpty &&
                points.last is TextElement) {
              var lastText = points.last as TextElement;
              if (lastText.text.isEmpty) {
                setState(() {
                  askForText = true;
                  textPromptController.clear();
                });
              }
            }
          },

          child: Transform.scale(
            scale: counter / 100,
            child: CustomPaint(
              foregroundPainter: CustomPainterPen(
                points,
                selectedColor,
                selectedPenSize,
              ),
              painter: CanvasBackground(),
              size: Size(screenWidth, screenHeight),
            ),
          ),
        ),

        Positioned(
          top: screenHeight * 0.2,
          left: screenWidth * 0.003,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ToolBox(
                onTextChange: onTextChanged,
                showProperties: showProperties,
                onPenChanged: changePenSize,
                selectedPenSize: selectedPenSize,
                onToolChanged: changeTool,
                selectedTool: selectedTool,
                onColorChanged: changeColour,
                onShapeChanged: onShapeChange,
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
        CustomAppBar(),
        CustomBottomBar(
          onRedo: redo,
          onUndo: undo,
          clearPoints: onClear,
          counter: counter,
          zoomIn: onZoomIn,
          zoomOut: onZoomOut,
        ),

        if (askForText)
          Positioned.fill(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                color: Colors.black54,
                alignment: Alignment.center,
                child: Container(
                  color: Colors.transparent,
                  child: Container(
                    width: screenWidth * 0.3,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 30, 30, 30),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white10, width: 1),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 25,
                          spreadRadius: 5,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Enter Text",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: textPromptController,
                          autofocus: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Type something...",
                            hintStyle: const TextStyle(color: Colors.white54),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white54,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  askForText = false;
                                  points.removeLast(); 
                                });
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white70,
                              ),
                              child: const Text("Cancel"),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  askForText = false;
                                  if (points.isNotEmpty &&
                                      points.last is TextElement) {
                                    var lastText = points.last as TextElement;
                                    points[points.length - 1] = TextElement(
                                      startPosition: lastText.startPosition,
                                      endPosition: lastText.endPosition,
                                      text: textPromptController.text,
                                      color: lastText.color,
                                      size: lastText.size,
                                    );
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  59,
                                  129,
                                  244,
                                ),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text("Place Text"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
