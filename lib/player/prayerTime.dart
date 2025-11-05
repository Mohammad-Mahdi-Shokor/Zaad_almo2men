import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zaad_almo2men/appBAr.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class Prayertime extends StatefulWidget {
  const Prayertime({super.key});

  @override
  State<Prayertime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<Prayertime> {
  int sajde = 0;
  int rok3a = 1;
  List<String> prayers = [];
  void sajad() async {
    try {
      List<String> times = await getPrayerTime();
      if (!mounted) return;
      setState(() {
        prayers = times;
      });
    } catch (e) {
      log("Error: $e");
    }
  }

  final prayerNames = ["الصبح", "الظهر", "العصر", "المغرب", "العشاء"];
  Future<List<String>> getPrayerTime() async {
    final url = Uri.parse(
        "http://api.aladhan.com/v1/timingsByCity?city=Beirut&country=Lebanon&method=5");

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to load prayer times: ${response.statusCode}");
    }

    final data = jsonDecode(response.body);

    final timings = data["data"]["timings"];

    return [
      timings["Fajr"], // 0 - الصبح
      timings["Dhuhr"], // 1 - الظهر
      timings["Asr"], // 2 - العصر
      timings["Maghrib"], // 3 - المغرب
      timings["Isha"], // 4 - العشاء
    ];
  }

  final List<IconData> prayerIcons = [
    Icons.wb_twilight, // Fajr
    Icons.wb_sunny, // Dhuhr
    Icons.cloud, // Asr
    Icons.nightlight, // Maghrib
    Icons.bedtime, // Isha
  ];
  @override
  void initState() {
    super.initState();
    sajad();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: app("مواقيت الصلاة", context),
      body: prayers.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: prayers.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            prayerIcons[index],
                            size: width * 0.12,
                            color: Colors.blue[800],
                          ),
                          SizedBox(height: width * 0.03),
                          Text(
                            prayerNames[index],
                            style: TextStyle(
                              fontSize: width * 0.06,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          SizedBox(height: width * 0.02),
                          Text(
                            prayers[index],
                            style: TextStyle(
                              fontSize: width * 0.055,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}

Text myTextStyle(double width, String text) {
  return Text(text,
      style: TextStyle(
          fontSize: width > 550 ? width * 0.03 : width * 0.07,
          fontWeight: FontWeight.bold,
          color: Colors.blue[800]));
}
