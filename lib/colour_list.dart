import 'package:flutter/material.dart';

class ColourList extends StatefulWidget {
  final Function(Color) onColourChange;
  const ColourList({super.key, required this.onColourChange});

  @override
  State<ColourList> createState() => _ColourListState();
}

class _ColourListState extends State<ColourList> {
  String isSelected = "";

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Choose Color",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 16),

          Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      isSelected = "black";
                      widget.onColourChange(Colors.black);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected == "black"
                              ? const Color.fromARGB(255, 59, 129, 244)
                              : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(3),
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      isSelected = "amber";
                      widget.onColourChange(Colors.amber);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected == "amber"
                              ? const Color.fromARGB(255, 59, 129, 244)
                              : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      isSelected = "cyan";
                      widget.onColourChange(
                        const Color.fromARGB(255, 47, 192, 211),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected == "cyan"
                              ? const Color.fromARGB(255, 59, 129, 244)
                              : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(3),
                        color: const Color.fromARGB(255, 47, 192, 211),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      isSelected = "green";
                      widget.onColourChange(
                        const Color.fromARGB(255, 4, 151, 97),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected == "green"
                              ? const Color.fromARGB(255, 59, 129, 244)
                              : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(3),
                        color: const Color.fromARGB(255, 4, 151, 97),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      isSelected = "pink";
                      widget.onColourChange(
                        const Color.fromARGB(255, 197, 38, 156),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected == "pink"
                              ? const Color.fromARGB(255, 59, 129, 244)
                              : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(3),
                        color: const Color.fromARGB(255, 197, 38, 156),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      isSelected = "purple";
                      widget.onColourChange(
                        const Color.fromARGB(255, 72, 64, 173),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected == "purple"
                              ? const Color.fromARGB(255, 59, 129, 244)
                              : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(3),
                        color: const Color.fromARGB(255, 72, 64, 173),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      isSelected = "red";
                      widget.onColourChange(
                        const Color.fromARGB(255, 179, 21, 22),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      width: boxWidth,
                      height: boxWidth,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected == "red"
                              ? const Color.fromARGB(255, 59, 129, 244)
                              : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(3),
                        color: const Color.fromARGB(255, 179, 21, 22),
                      ),
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
