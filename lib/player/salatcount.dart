import 'package:flutter/material.dart';
import 'package:zaad_almo2men/appBAr.dart';

class Salatcount extends StatefulWidget {
  const Salatcount({super.key});

  @override
  State<Salatcount> createState() => _TasbeehplayerState();
}

class _TasbeehplayerState extends State<Salatcount> {
  int sajde = 0;
  int rok3a = 1;

  void sajad() {
    // in case of sojod => make the cal for knowing rek3a
    setState(() {
      if (sajde >= 2) {
        sajde = 1;
        rok3a++;
      } else {
        sajde++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: app("عداد ركعات", context),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: height > 600 ? height * 0.3 : height * 0.43,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("السجدة",
                            style: TextStyle(
                                fontSize:
                                    width > 550 ? width * 0.03 : width * 0.07,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[800])),
                        SizedBox(
                          height: height > 550 ? (width > 600 ? 15 : 25) : 0,
                        ),
                        Text("$sajde",
                            style: TextStyle(
                                fontSize:
                                    width > 550 ? width * 0.06 : width * 0.18))
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    thickness: 3,
                  ),
                  SizedBox(
                    width: width * 0.45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("الركعة",
                            style: TextStyle(
                                fontSize:
                                    width > 550 ? width * 0.03 : width * 0.07,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[800])),
                        SizedBox(
                          height: height > 550 ? (width > 600 ? 15 : 25) : 0,
                        ),
                        Text("$rok3a",
                            style: TextStyle(
                                fontSize:
                                    width > 550 ? width * 0.06 : width * 0.18))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.06,
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(1)),
              width: width * 0.85,
              height: height > 500 ? height * 0.5 : height * 0.2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  sajad();
                },
                child: Text(
                  "اضغط هنا قبل السجود",
                  style: TextStyle(fontSize: width * 0.08),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
