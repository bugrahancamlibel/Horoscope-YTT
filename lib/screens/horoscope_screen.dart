import 'package:flutter/material.dart';

class Horoscope extends StatelessWidget {
  const Horoscope({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            Card(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 140,
                child: SingleChildScrollView(
                  child: ListTile(
                    title: Text("Fortune"),
                    subtitle: Text(
                      "You\'re feeling expansive, expensive and extremely generous -- can you stand it? More importantly, can your wallet? (Probably, just this once.) Go ahead and indulge in something flashy and so not you -- the more sparkle, the better.",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
