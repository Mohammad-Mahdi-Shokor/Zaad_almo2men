import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaad_almo2men/appBAr.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    var avg = (MediaQuery.of(context).size.width +
            MediaQuery.of(context).size.height) /
        2;
    return Scaffold(
      appBar: app("عن التطبيق", context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Text(
            textDirection: TextDirection.rtl,
            " زاد المؤمن: هو تطبيق للمبرمج محمد مهدي شكر :)  يشمل تعقيبات وأدعية مستحبة للمؤمنين . و يضم أيضا عدادين ، للصلاة و التسبيحات وتم برمجته بلغة 'دارت' \n\nيحتوي التطبيق أيضاً على تسجيلات لبعض الأدعية للقارئ الشه.يد حسين غريّب (رحمه الله) ",
            style: GoogleFonts.cairo(fontSize: avg * 0.045),
          ),
        ),
      ),
    );
  }
}
