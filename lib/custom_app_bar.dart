import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.heightOf(context);

    return Align(
      alignment: AlignmentGeometry.topStart,
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.075,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(32, 0, 0, 0),
              spreadRadius: 5,
              blurRadius: 30,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 8.0,
              ),
              child: Icon(
                Icons.menu,
                color: const Color.fromARGB(255, 33, 33, 33),
                size: 22,
              ),
            ),
            Text(
              "White Board",
              style: TextStyle(
                color: const Color.fromARGB(255, 33, 33, 33),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  final Function(bool) clearPoints;
  final Function onUndo;
  final Function onRedo;
  final double counter;
  final Function zoomIn;
  final Function zoomOut;
  const CustomBottomBar({
    super.key,
    required this.onUndo,
    required this.onRedo,
    required this.clearPoints,
    required this.counter,
    required this.zoomIn,
    required this.zoomOut,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.widthOf(context);
    var screenHeight = MediaQuery.heightOf(context);
    return Align(
      alignment: AlignmentGeometry.bottomCenter,
      child: Container(
        margin: EdgeInsets.all(20),
        width: screenWidth * 0.3,
        height: screenHeight * 0.09,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(32, 0, 0, 0),
              spreadRadius: 5,
              blurRadius: 30,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        onUndo();
                      },
                      child: Image.asset("assets/images/undo.png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        onRedo();
                      },
                      child: GestureDetector(
                        child: Image.asset("assets/images/redo.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 24,
              decoration: BoxDecoration(
                border: Border(left: BorderSide(color: Colors.grey)),
              ),
            ),
            SizedBox(
              width: 120,
              height: 24,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      zoomIn();
                    },
                    child: Icon(Icons.zoom_in, size: 25),
                  ),

                  Text("${counter.toInt()} %", style: TextStyle(fontSize: 16)),
                  GestureDetector(
                    onTap: () {
                      zoomOut();
                    },
                    child: Icon(Icons.zoom_out, size: 25),
                  ),
                ],
              ),
            ),
            Container(
              height: 24,
              decoration: BoxDecoration(
                border: Border(left: BorderSide(color: Colors.grey)),
              ),
            ),
            GestureDetector(
              onTap: () {
                clearPoints(true);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: GestureDetector(
                    child: Image.asset("assets/images/mop.png"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
