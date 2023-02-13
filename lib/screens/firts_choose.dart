import 'package:flutter/material.dart';

const List<String> list = <String>['Aries', 'Taurus', 'Gemini', 'Cancer', 'Leo',
  'Virgo', 'Libra', 'Scorpio', 'Sagittarius', 'Capricorn', 'Aquarius', 'Pisces'];

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
      body: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
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
    );
  }
}
