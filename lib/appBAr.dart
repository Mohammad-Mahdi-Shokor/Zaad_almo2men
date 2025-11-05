import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar app(String T, BuildContext context) {
  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.width / 8.5,
    centerTitle: true,
    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    title: Text(
      T,
      style: GoogleFonts.lalezar(
          fontSize: MediaQuery.of(context).size.width / 10,
          fontWeight: FontWeight.w200),
    ),
  );
}
