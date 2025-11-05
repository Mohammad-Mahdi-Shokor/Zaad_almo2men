import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ad3eye/الأدعية.dart';
import 'appBAr.dart';
import 'player/ad3eyeplayer.dart';

// ignore: must_be_immutable
class Ad3eye extends StatefulWidget {
  const Ad3eye(this.a, {super.key});
  final ad3eyee a;
  @override
  State<Ad3eye> createState() => _Ad3eyeState();
}

class _Ad3eyeState extends State<Ad3eye> {
  @override
  Widget build(BuildContext context) {
    var avg = (MediaQuery.of(context).size.width +
            MediaQuery.of(context).size.height) /
        2;
    var place;
    if (widget.a == ad3eyee.osbo3) {
      place = osbo3e_arr;
    } else if (widget.a == ad3eyee.yawme) {
      place = daily_arr;
    } else {
      place = zeyarat_arr;
    }
    return Scaffold(
        appBar: app(Ad3eyeeArabic[widget.a]!, context),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...inarabic.keys.map((key) {
                  if (place.contains(key)) {
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
                                        builder: (context) =>
                                            Ad3eyeplayer(key)));
                              },
                              child: Container(
                                margin: EdgeInsets.all(avg * 0.017),
                                child: Text(
                                  inarabic[key]!,
                                  style:
                                      GoogleFonts.cairo(fontSize: avg * 0.06),
                                ),
                              )),
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                })
              ],
            ),
          ),
        ));
  }
}
