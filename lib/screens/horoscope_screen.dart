import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model.dart';
import '../providers/horoscope_provider.dart';

class HoroscopeScreen extends ConsumerWidget {
  HoroscopeScreen(this.day, {Key? key}) : super(key: key);

  final String day;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<HoroscopeModel> todayHoroscopeConsumer =
        ref.watch(HoroscopeProvider(day));

    return SingleChildScrollView(
      child: Center(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Card(
                    color: const Color(0xFFF1E9F7),
                    shadowColor: Colors.purple,
                    elevation: 10,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 140,
                      child: SingleChildScrollView(
                        child: ListTile(
                          title: const Text("Fortune"),
                          subtitle: Text(
                              todayHoroscopeConsumer.value?.description.toString() ??
                                  "loading..."),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Card(
                    color: const Color(0xFFF1E9F7),
                    elevation: 10,
                    shadowColor: Colors.purple,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: SingleChildScrollView(
                        child: ListTile(
                          title: const Text("Your..."),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: '',
                                        style: DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          const TextSpan(
                                              text: 'Lucky Number: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text: todayHoroscopeConsumer
                                                  .value?.luckyNumber
                                                  .toString() ??
                                                  "loading..."),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: '',
                                        style: DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          const TextSpan(
                                              text: 'Lucky Time: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text: todayHoroscopeConsumer
                                                  .value?.luckyTime
                                                  .toString() ??
                                                  "loading..."),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: '',
                                        style: DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          const TextSpan(
                                              text: 'Color: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text: todayHoroscopeConsumer
                                                  .value?.color
                                                  .toString() ??
                                                  "loading..."),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: '',
                                        style: DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          const TextSpan(
                                              text: 'Mood: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text: todayHoroscopeConsumer.value?.mood
                                                  .toString() ??
                                                  "loading..."),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Card(
                    color: const Color(0xFFF1E9F7),
                    shadowColor: Colors.purple,
                    elevation: 10,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 160,
                      child: ListTile(
                            title: const Text("Compatibility"),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/${todayHoroscopeConsumer.value?.compatibility.toLowerCase().toString() ?? "1"}.png",
                                    height: 80,
                                  ),
                                  Text(todayHoroscopeConsumer.value?.compatibility
                                      .toString() ??
                                      "loading..."),
                                ],
                              ),
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
