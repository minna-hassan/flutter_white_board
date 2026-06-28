import 'package:flutter/material.dart';

class SizeList extends StatefulWidget {
  final double selectedPenSize;
  final Function(double) onSelectPen;

  const SizeList({
    super.key,
    required this.selectedPenSize,
    required this.onSelectPen,
  });

  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  var isSelectedSize = "";
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.widthOf(context);
    var screenHeight = MediaQuery.heightOf(context);

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
      child: SizedBox(
        width: screenWidth * 0.2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Stroke Weight",
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedSize = "2.30";
                    });
                    widget.onSelectPen(2.30);
                  },
                  onPanUpdate: (details) {},
                  child: Container(
                    width: screenWidth * 0.25,
                    height: screenHeight * 0.1,
                    decoration: BoxDecoration(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: isSelectedSize == "2.30"
                              ? Icon(
                                  Icons.circle,
                                  color: const Color.fromARGB(
                                    255,
                                    59,
                                    129,
                                    244,
                                  ),
                                  size: 10,
                                )
                              : Icon(
                                  Icons.circle,
                                  color: Colors.white,
                                  size: 10,
                                ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            "2.30 px",
                            style: TextStyle(
                              color: isSelectedSize == "2.30"
                                  ? const Color.fromARGB(255, 59, 129, 244)
                                  : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(0),
                          width: screenWidth * 0.1,
                          height: screenHeight * 0.07,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/pencil_stroke.png",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedSize = "3.50";
                    });
                    widget.onSelectPen(3.50);
                  },
                  child: Container(
                    width: screenWidth * 0.25,
                    height: screenHeight * 0.1,
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: isSelectedSize == "3.50"
                              ? Icon(
                                  Icons.circle,
                                  color: const Color.fromARGB(
                                    255,
                                    59,
                                    129,
                                    244,
                                  ),
                                  size: 14,
                                )
                              : Icon(
                                  Icons.circle,
                                  color: Colors.white,
                                  size: 14,
                                ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            "3.50 px",
                            style: TextStyle(
                              color: isSelectedSize == "3.50"
                                  ? const Color.fromARGB(255, 59, 129, 244)
                                  : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(0),
                          width: screenWidth * 0.1,
                          height: screenHeight * 0.07,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/marker_stroke.png",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedSize = "6.30";
                    });
                    widget.onSelectPen(6.30);
                  },
                  child: Container(
                    width: screenWidth * 0.25,
                    height: screenHeight * 0.1,
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: isSelectedSize == "6.30"
                              ? Icon(
                                  Icons.circle,
                                  color: const Color.fromARGB(
                                    255,
                                    59,
                                    129,
                                    244,
                                  ),
                                  size: 18,
                                )
                              : Icon(
                                  Icons.circle,
                                  color: Colors.white,
                                  size: 18,
                                ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            "6.30 px",
                            style: TextStyle(
                              color: isSelectedSize == "6.30"
                                  ? const Color.fromARGB(255, 59, 129, 244)
                                  : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(0),
                          width: screenWidth * 0.09,
                          height: screenHeight * 0.07,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                "assets/images/fine_marker_stroke.png",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedSize = "12.30";
                    });
                    widget.onSelectPen(12.30);
                  },
                  child: Container(
                    width: screenWidth * 0.25,
                    height: screenHeight * 0.1,
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: isSelectedSize == "12.30"
                              ? Icon(
                                  Icons.circle,
                                  color: const Color.fromARGB(
                                    255,
                                    59,
                                    129,
                                    244,
                                  ),
                                  size: 20,
                                )
                              : Icon(
                                  Icons.circle,
                                  color: Colors.white,
                                  size: 20,
                                ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            "12.30 px",
                            style: TextStyle(
                              color: isSelectedSize == "12.30"
                                  ? const Color.fromARGB(255, 59, 129, 244)
                                  : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(0),
                          width: screenWidth * 0.09,
                          height: screenHeight * 0.07,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                "assets/images/chisel_nib_marker_stroke.png",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
