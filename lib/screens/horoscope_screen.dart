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
            Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: SingleChildScrollView(
                    child: ListTile(
                      title: Text("Your..."),
                      subtitle: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: '',
                                    style: DefaultTextStyle.of(context).style,
                                    children: const <TextSpan>[
                                      TextSpan(text: 'Lucky Number: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: '7'),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                                RichText(
                                  text: TextSpan(
                                    text: '',
                                    style: DefaultTextStyle.of(context).style,
                                    children: const <TextSpan>[
                                      TextSpan(text: 'Lucky Color: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: 'Blue'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: '',
                                    style: DefaultTextStyle.of(context).style,
                                    children: const <TextSpan>[
                                      TextSpan(text: 'Color: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: 'Green'),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                                RichText(
                                  text: TextSpan(
                                    text: '',
                                    style: DefaultTextStyle.of(context).style,
                                    children: const <TextSpan>[
                                      TextSpan(text: 'Mood: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: 'Happy'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ),
                  ),
                ),

            ),
            Card(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 140,
                child: SingleChildScrollView(
                  child: ListTile(
                    title: Text("Compatibility"),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Image.asset("assets/images/gemini.png", height: 80,),
                          Text("Gemini"),
                        ],
                      ),
                    )
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
