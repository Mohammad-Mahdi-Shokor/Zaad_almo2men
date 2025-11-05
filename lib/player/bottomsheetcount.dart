import 'package:flutter/material.dart';

class Bottomsheetcount extends StatefulWidget {
  const Bottomsheetcount({super.key});

  @override
  State<Bottomsheetcount> createState() => _BottomsheetcountState();
}

class _BottomsheetcountState extends State<Bottomsheetcount> {
  int counter = 0;
  void sabe7() {
    setState(() {
      counter++;
    });
  }

  void safer() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$counter",
          style: TextStyle(fontSize: width > 700 ? width * 0.15 : width * 0.35),
        ),
        SizedBox(
          height: height > 500 ? height * 0.05 : 0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.outlined(
                onPressed: () {
                  safer();
                },
                icon: Icon(Icons.redo,
                    size: width > 700 ? width * 0.1 : width * 0.2)),
            SizedBox(
              width: width * 0.15,
            ),
            IconButton.outlined(
                onPressed: () {
                  sabe7();
                },
                icon: Icon(
                  Icons.add,
                  size: width > 700 ? width * 0.1 : width * 0.2,
                )),
          ],
        )
      ],
    ));
  }
}
