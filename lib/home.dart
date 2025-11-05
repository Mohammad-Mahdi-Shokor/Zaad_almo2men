import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaad_almo2men/info.dart';
import 'package:zaad_almo2men/ordered_ad3eye.dart';
import 'package:zaad_almo2men/player/bottomsheetcount.dart';
import 'package:zaad_almo2men/player/prayerTime.dart';
import 'package:zaad_almo2men/player/salatcount.dart';
import 'package:zaad_almo2men/ta3kebaat.dart';

class Home extends StatelessWidget {
  Home({super.key});

  // Single map to store both the image path and the corresponding widget
  final Map<String, Map<String, dynamic>> typesWithDetails = {
    "التعقيبات": {
      "image": "images/ta3kebat.png",
      "widget": const Ta3kebaat(),
    },
    "الأدعية": {
      "image": "images/prayingg.png",
      "widget": const OrderedAd3eye(),
    }
  };

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // var avg = (MediaQuery.of(context).size.width +
    //    MediaQuery.of(context).size.height) /
    //  2;
    // Create a list of buttons to display
    List<Widget> buttonList = typesWithDetails.keys.map((type) {
      return Column(children: [
        ElevatedButton(
          onPressed: () {
            // Navigate to the corresponding screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => typesWithDetails[type]!["widget"],
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display the CircleAvatar with the corresponding image
              CircleAvatar(
                radius: height > width ? height * 0.06 : width * 0.05,
                backgroundImage: AssetImage(typesWithDetails[type]!["image"]),
              ),
              const Spacer(),
              // Display the text with a dynamic font size
              Text(
                type,
                style: GoogleFonts.cairo(
                  fontSize: MediaQuery.of(context).size.width > 600 ? 80 : 45,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.07),
      ]);
    }).toList();

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: height > 500
                  ? (width > 700 ? height * 0.15 : height * 0.3)
                  : 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Info()));
                    },
                    icon: const Icon(
                      Icons.info,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [...buttonList], // Display the list of buttons
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        // floating buttons on the buttom
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Salatcount(),
                  ),
                );
              },
              backgroundColor: Colors.white,
              child: Image.asset(
                "images/sojod.png",
                width: 45,
                height: 45,
              ),
            ),
          ),
          const Spacer(),
          FloatingActionButton(
            onPressed: () {
              showBottomSheet(
                  context: context,
                  builder: (context) {
                    return const Bottomsheetcount();
                  });
            },
            backgroundColor: Colors.white,
            child: Image.asset(
              "images\\download.png",
              height: 45,
              width: 45,
            ),
          ),
          const Spacer(),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Prayertime();
                },
              ));
            },
            backgroundColor: Colors.white,
            child: Image.asset(
              "images\\prayImage.png",
              height: 45,
              width: 45,
            ),
          ),
        ],
      ),
    );
  }
}
