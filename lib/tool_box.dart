import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/tool_box_properties.dart';

class ToolBox extends StatefulWidget {
  final double selectedTool;
  final Function(double) onToolChanged;
  final Function(Color) onColorChanged;
  final double selectedPenSize;
  final Function(double) onPenChanged;
  final Function(String, bool) onShapeChanged;
  final Function(String) onTextChange;
  final bool showProperties;

  const ToolBox({
    super.key,
    required this.onTextChange,
    required this.showProperties,
    required this.onToolChanged,
    required this.selectedTool,
    required this.onColorChanged,
    required this.onPenChanged,
    required this.selectedPenSize,

    required this.onShapeChanged,
  });

  @override
  State<ToolBox> createState() => _ToolBoxState();
}

class _ToolBoxState extends State<ToolBox> {
  double selectedColor = 0;
  var selectedBorder = Colors.white;
  var unselectedBorder = const Color.fromARGB(69, 134, 133, 133);
  bool showProperties = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.widthOf(context);
    var screenHeight = MediaQuery.heightOf(context);
    var containerWidth = screenWidth * 0.04;
    var containerHeight = screenHeight * 0.07;
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 5),
          height: screenHeight * 0.5,
          width: screenWidth * 0.055,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 40,
                spreadRadius: 10,
              ),
            ],
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(8),
          ),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: .spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: .spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.onToolChanged(1);
                        showProperties = true;
                      });
                    },

                    child: Container(
                      margin: EdgeInsets.only(top: 0),
                      width: containerWidth,
                      height: containerHeight,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: widget.selectedTool == 1
                              ? const Color.fromARGB(255, 59, 129, 244)
                              : Colors.transparent,
                        ),
                      ),
                      child: Image.asset("assets/images/pencil_icon_tool.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.onToolChanged(2);
                        showProperties = true;
                      });
                    },

                    child: Container(
                      margin: EdgeInsets.only(top: 0),
                      width: containerWidth,
                      height: containerHeight,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: widget.selectedTool == 2
                              ? const Color.fromARGB(255, 59, 129, 244)
                              : Colors.transparent,
                        ),
                      ),
                      child: Image.asset("assets/images/bucket_tool_icon.png"),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.onToolChanged(3);
                        showProperties = true;
                      });
                    },

                    child: Container(
                      margin: EdgeInsets.only(top: 0),
                      width: containerWidth,
                      height: containerHeight,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: widget.selectedTool == 3
                              ? const Color.fromARGB(255, 59, 129, 244)
                              : Colors.transparent,
                        ),
                      ),
                      child: Icon(
                        Icons.circle,
                        size: 11,
                        color: const Color.fromARGB(255, 17, 18, 18),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.onToolChanged(5);
                        showProperties = true;
                      });
                    },

                    child: Container(
                      margin: EdgeInsets.only(top: 0),
                      width: containerWidth,
                      height: containerHeight,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: widget.selectedTool == 5
                              ? const Color.fromARGB(255, 59, 129, 244)
                              : Colors.transparent,
                        ),
                      ),
                      child: Icon(
                        Icons.interests_outlined,
                        size: 25,
                        color: const Color.fromARGB(255, 59, 129, 244),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.onToolChanged(7);
                        showProperties = true;
                      });
                    },

                    child: Container(
                      margin: EdgeInsets.only(top: 0),
                      width: containerWidth,
                      height: containerHeight,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: widget.selectedTool == 7
                              ? const Color.fromARGB(255, 59, 129, 244)
                              : Colors.transparent,
                        ),
                      ),
                      child: Icon(
                        Icons.text_fields_rounded,
                        size: 25,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.onToolChanged(8);
                        showProperties = true;
                      });
                    },

                    child: Container(
                      margin: EdgeInsets.only(top: 0),
                      width: containerWidth,
                      height: containerHeight,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: widget.selectedTool == 8
                              ? const Color.fromARGB(255, 59, 129, 244)
                              : Colors.transparent,
                        ),
                      ),
                      child: Image.asset("assets/images/eraser_tool_icon.png"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        if (widget.showProperties)
          ToolsDetails(
            onTextChanged: widget.onTextChange,
            onShapeChange: widget.onShapeChanged,
            selectedTool: widget.selectedTool,
            onColorChanged: (p0) {
              widget.onColorChanged(p0);
              setState(() {});
            },
            onPenChanged: (p0) {
              widget.onPenChanged(p0);
            },
            selectedPenSize: widget.selectedPenSize,
          ),
      ],
    );
  }
}
