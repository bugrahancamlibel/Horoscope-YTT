import 'package:flutter/material.dart';
import 'package:horoscope_ytt/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

const List<String> list = <String>[
  'Aries',
  'Taurus',
  'Gemini',
  'Cancer',
  'Leo',
  'Virgo',
  'Libra',
  'Scorpio',
  'Sagittarius',
  'Capricorn',
  'Aquarius',
  'Pisces'
];

class FirstChoose extends StatefulWidget {
  const FirstChoose({Key? key}) : super(key: key);

  @override
  State<FirstChoose> createState() => _FirstChooseState();
}

class _FirstChooseState extends State<FirstChoose> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Select your star sign",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    color: Color(0XFF3F3D56),
                    height: 2.0)),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.star_sharp),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Image.asset(
              "assets/images/${dropdownValue.toString().toLowerCase()}.png",
              height: 100,
            ),
            ElevatedButton(onPressed: () async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('starSign', dropdownValue.toString());
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              );
            }, child: const Text("Go to your page"))
          ],
        ),
      ),
    );
  }
}
