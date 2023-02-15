import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_ytt/screens/main_screen.dart';
import 'package:horoscope_ytt/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(child: MyApp(prefs: prefs)));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    bool seen = (prefs.getBool('seen') ?? false);
    if (seen) {
      print("its seen!");
      return MaterialApp(
        title: 'Horoscope Yesterday Today and Tomorrow',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)),
        home: const MainScreen(),
      );
    } else {
      print("its not seen");
      prefs.setBool('seen', true);
      return MaterialApp(
        title: 'Horoscope Yesterday Today and Tomorrow',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)),
        home: const WelcomeScreen(),
      );
    }
  }
}
