import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../star_sign_provider.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final starSignConsumer = ref.watch(starSignProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Horoscope"),
        actions: [
          Center(child: Text(starSignConsumer.value.toString())),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.purple,
            width: 100,
            height: 100,
          )
        ],
      ),
    );
  }
}
