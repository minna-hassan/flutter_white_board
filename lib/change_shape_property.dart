import 'package:flutter/material.dart';

class ShapeList extends StatefulWidget {
  final Widget colorList;

  final Function(String, bool) onDrawShape;

  const ShapeList({
    super.key,

    required this.onDrawShape,
    required this.colorList,
  });

  @override
  State<ShapeList> createState() => _ShapeListState();
}

class _ShapeListState extends State<ShapeList> {
  String isSelected = '';
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.widthOf(context);

    var boxWidth = screenWidth * 0.025;

    return Container(
      width: screenWidth * 0.2,
      padding: const EdgeInsets.all(16.0),
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
        children: [
          Align(
            alignment: AlignmentGeometry.center,
            child: Text(
              "Select Shape",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(height: 5),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Text(
              "Outlined",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(height: 2),

          Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.onDrawShape("line", false);
                      isSelected = "line";
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 8,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: isSelected == "line"
                          ? Image.asset("assets/images/diagonal_line_blue.png")
                          : Image.asset("assets/images/diagonal_line.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onDrawShape("circle", false);
                      isSelected = "circle";
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: isSelected == "circle"
                          ? Icon(
                              Icons.circle_outlined,
                              color: const Color.fromARGB(255, 59, 129, 244),
                              size: 30,
                            )
                          : Icon(
                              Icons.circle_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onDrawShape("square", false);
                      isSelected = "square";
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: isSelected == "square"
                          ? Icon(
                              Icons.square_outlined,
                              color: const Color.fromARGB(255, 59, 129, 244),
                              size: 30,
                            )
                          : Icon(
                              Icons.square_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onDrawShape("triangle", false);
                      isSelected = "triangle";
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: isSelected == "triangle"
                          ? Icon(
                              Icons.change_history_outlined,
                              color: const Color.fromARGB(255, 59, 129, 244),
                            )
                          : Icon(
                              Icons.change_history_outlined,
                              color: Colors.white,
                            ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onDrawShape("pentagon", false);
                      isSelected = "pentagon";
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: isSelected == "pentagon"
                          ? Icon(
                              Icons.pentagon_outlined,
                              color: const Color.fromARGB(255, 59, 129, 244),
                              size: 30,
                            )
                          : Icon(
                              Icons.pentagon_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.onDrawShape("star", false);
                      isSelected = "star";
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: isSelected == "star"
                          ? Icon(
                              Icons.star_border,
                              color: const Color.fromARGB(255, 59, 129, 244),
                              size: 30,
                            )
                          : Icon(
                              Icons.star_border,
                              color: Colors.white,
                              size: 30,
                            ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onDrawShape("label", false);
                      isSelected = "label";
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: isSelected == "label"
                          ? Icon(
                              Icons.label_outline,
                              color: const Color.fromARGB(255, 59, 129, 244),
                              size: 30,
                            )
                          : Icon(
                              Icons.label_outline,
                              color: Colors.white,
                              size: 30,
                            ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onDrawShape("hexagon", false);
                      isSelected = "hexagon";
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: isSelected == "hexagon"
                          ? Icon(
                              Icons.hexagon_outlined,
                              color: const Color.fromARGB(255, 59, 129, 244),
                              size: 30,
                            )
                          : Icon(
                              Icons.hexagon_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Text(
              "Filled",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(height: 2),

          Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.onDrawShape("hexagon", true);
                      isSelected = "filled_hexagon";
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: isSelected == "filled_hexagon"
                          ? Icon(
                              Icons.hexagon,
                              color: const Color.fromARGB(255, 59, 129, 244),
                              size: 30,
                            )
                          : Icon(
                              Icons.hexagon,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              size: 30,
                            ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onDrawShape("circle", true);
                      isSelected = "filled_circle";
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: isSelected == "filled_circle"
                          ? Icon(
                              Icons.circle,
                              color: const Color.fromARGB(255, 59, 129, 244),
                              size: 30,
                            )
                          : Icon(
                              Icons.circle,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              size: 30,
                            ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onDrawShape("square", true);
                      isSelected = "filled_square";
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: isSelected == "filled_square"
                          ? Icon(
                              Icons.square,
                              color: const Color.fromARGB(255, 59, 129, 244),
                              size: 30,
                            )
                          : Icon(
                              Icons.square,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              size: 30,
                            ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      widget.onDrawShape("pentagon", true);
                      isSelected = "filled_pentagon";
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: isSelected == "filled_pentagon"
                          ? Icon(
                              Icons.pentagon,
                              color: const Color.fromARGB(255, 59, 129, 244),
                              size: 30,
                            )
                          : Icon(Icons.pentagon, color: Colors.white, size: 30),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.onDrawShape("star", true);
                      isSelected = "filled_star";
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: isSelected == "filled_star"
                          ? Icon(
                              Icons.star,
                              color: const Color.fromARGB(255, 59, 129, 244),
                              size: 30,
                            )
                          : Icon(Icons.star, color: Colors.white, size: 30),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onDrawShape("filled_label", true);
                      isSelected = "filled_label";
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: isSelected == "filled_label"
                          ? Icon(
                              Icons.label,
                              color: const Color.fromARGB(255, 59, 129, 244),
                              size: 30,
                            )
                          : Icon(Icons.label, color: Colors.white, size: 30),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
