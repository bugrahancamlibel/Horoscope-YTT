import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_ytt/selected_index_provider.dart';
import '../star_sign_provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
const List<Widget> _widgetOptions = <Widget>[
  Text(
    'Yesterday',
    style: optionStyle,
  ),
  Text(
    'Today',
    style: optionStyle,
  ),
  Text(
    'Tomorrow',
    style: optionStyle,
  ),
];

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final starSignConsumer = ref.watch(starSignProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Horoscope"),
        actions: [
          Center(child: Text("You are ${starSignConsumer.value.toString()}")),
          const SizedBox(
            width: 20,
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: GNav(
            tabMargin: EdgeInsets.only(bottom: 5),
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.purple,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.white,
            tabs: const [
              GButton(
                icon: Icons.arrow_back_outlined,
                text: 'Yesterday',
              ),
              GButton(
                icon: Icons.circle,
                text: 'Today',
              ),
              GButton(
                icon: Icons.arrow_forward_outlined,
                text: 'Tomorrow',
              ),
            ],
            selectedIndex: ref.watch(selectedIndexProvider),
            onTabChange: (index) {
              ref.read(selectedIndexProvider.notifier).state = index;
            },
          ),
        ),
      ),
      body: _widgetOptions.elementAt(ref.watch(selectedIndexProvider)),

    );
  }
}
