import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaad_almo2men/ad3eye/%D8%A7%D9%84%D8%AA%D8%B9%D9%82%D9%8A%D8%A8%D8%A7%D8%AA.dart';
import 'package:zaad_almo2men/appBAr.dart';
import 'package:zaad_almo2men/player/ta3kebatplayer.dart';

class Ta3kebaat extends StatefulWidget {
  const Ta3kebaat({super.key});

  @override
  State<Ta3kebaat> createState() => _Ta3kebaatState();
}

class _Ta3kebaatState extends State<Ta3kebaat> {
  @override
  Widget build(BuildContext context) {
    var avg = (MediaQuery.of(context).size.width +
            MediaQuery.of(context).size.height) /
        2;
    return Scaffold(
        appBar: app("التعقيبات", context),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...ta3kebatinarabic.keys.map((key) {
                  return Column(
                    children: [
                      SizedBox(
                        height: avg * 0.04,
                      ),
                      Padding(
                        padding: EdgeInsets.all(avg * 0.02),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Ta3kebatplayer(key)));
                            },
                            child: Text(
                              ta3kebatinarabic[key]!,
                              style: GoogleFonts.cairo(fontSize: avg * 0.055),
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
