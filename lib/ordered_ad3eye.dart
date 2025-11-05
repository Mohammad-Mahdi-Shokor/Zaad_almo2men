import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaad_almo2men/Ad3eye.dart';
import 'package:zaad_almo2men/ad3eye/%D8%A7%D9%84%D8%A3%D8%AF%D8%B9%D9%8A%D8%A9.dart';
import 'package:zaad_almo2men/appBAr.dart';

class OrderedAd3eye extends StatefulWidget {
  const OrderedAd3eye({super.key});

  @override
  State<OrderedAd3eye> createState() => _OrderedAd3eyeState();
}

class _OrderedAd3eyeState extends State<OrderedAd3eye> {
  @override
  Widget build(BuildContext context) {
    var avg = (MediaQuery.of(context).size.width +
            MediaQuery.of(context).size.height) /
        2;
    return Scaffold(
        appBar: app("الأدعية", context),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...Ad3eyeeArabic.keys.map((key) {
                  var b = key;
                  return Column(
                    children: [
                      SizedBox(
                        height: avg * 0.04,
                      ),
                      Padding(
                        padding: EdgeInsets.all(avg * 0.01),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Ad3eye(b)));
                            },
                            child: Container(
                              margin: EdgeInsets.all(avg * 0.017),
                              child: Text(
                                Ad3eyeeArabic[key]!,
                                style: GoogleFonts.cairo(fontSize: avg * 0.06),
                              ),
                            )),
                      ),
                    ],
                  );
                })
              ],
            ),
          ),
        ));
  }
}
