import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaad_almo2men/home.dart';
import 'package:provider/provider.dart';
import 'package:zaad_almo2men/theme_notifiear.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeNotifier(),
    child: const MyApp(),
  ));
}

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color.fromARGB(255, 40, 138, 168)),
  useMaterial3: true,
);

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 40, 138, 168)),
  useMaterial3: true,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Zaad Almo2men',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeNotifier.themeMode,
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.width / 8.5,
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            "زاد المؤمن",
            style: GoogleFonts.lalezar(
                fontSize: MediaQuery.of(context).size.width / 10,
                fontWeight: FontWeight.w200),
          ),
          actions: [
            IconButton.outlined(
                iconSize: MediaQuery.of(context).size.width / 13,
                onPressed: () {
                  ThemeNotifier themeNotifier =
                      Provider.of<ThemeNotifier>(context, listen: false);
                  if (themeNotifier.themeMode == ThemeMode.light) {
                    themeNotifier.setTheme(ThemeMode.dark);
                  } else {
                    themeNotifier.setTheme(ThemeMode.light);
                  }
                },
                icon: const Icon(Icons.brightness_6))
          ],
        ),
        body: Home() // please write here the home :)
        );
  }
}
