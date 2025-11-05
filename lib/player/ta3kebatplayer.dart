import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaad_almo2men/ad3eye/%D8%A7%D9%84%D8%AA%D8%B9%D9%82%D9%8A%D8%A8%D8%A7%D8%AA.dart';
import 'package:zaad_almo2men/appBAr.dart';

class Ta3kebatplayer extends StatelessWidget {
  const Ta3kebatplayer(this.ta3keb, {super.key});
  final salawat ta3keb;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    var avg = (MediaQuery.of(context).size.width +
            MediaQuery.of(context).size.height) /
        2;
    return Scaffold(
      appBar: app(ta3kebatinarabic[ta3keb]!, context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width > 700 ? width * 0.15 : 25),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(18)),
              child: Column(children: [
                SizedBox(
                  height: avg * 0.07,
                ),
                Text(
                  textAlign: TextAlign.right,
                  ta3k3bat[ta3keb]!,
                  style: GoogleFonts.readexPro(fontSize: 22, height: 2.6),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
