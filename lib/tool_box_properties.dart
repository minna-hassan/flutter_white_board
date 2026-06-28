import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/colour_list.dart';
import 'package:flutter_drawing_board/change_shape_property.dart';
import 'change_stroke_size_property.dart';

class ToolsDetails extends StatefulWidget {
  final double selectedTool;
  final Function(Color) onColorChanged;
  final double selectedPenSize;
  final Function(double) onPenChanged;
  final Function(String, bool) onShapeChange;
  final Function(String) onTextChanged;

  const ToolsDetails({
    super.key,
    required this.onTextChanged,
    required this.selectedTool,
    required this.onColorChanged,
    required this.onPenChanged,
    required this.selectedPenSize,
    required this.onShapeChange,
  });

  @override
  State<ToolsDetails> createState() => _ToolsDetailsState();
}

class _ToolsDetailsState extends State<ToolsDetails> {
  TextEditingController texteditingController = TextEditingController();

  Widget onSelectTool() {
    if (widget.selectedTool == 2) {
      return ColourList(onColourChange: widget.onColorChanged);
    } else if (widget.selectedTool == 3) {
      return SizeList(
        onSelectPen: widget.onPenChanged,
        selectedPenSize: widget.selectedPenSize,
      );
    } else if (widget.selectedTool == 5) {
      return ShapeList(
        colorList: ColourList(onColourChange: widget.onColorChanged),
        onDrawShape: widget.onShapeChange,
      );
    } else if (widget.selectedTool == 7) {
      return Container();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return onSelectTool();
  }
}
