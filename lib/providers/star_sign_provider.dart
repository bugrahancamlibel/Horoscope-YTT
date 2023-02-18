import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

class StarSignStateNotifier extends StateNotifier<String> {
  final AsyncValue<SharedPreferences> _sharedPrefs;
  late final ValueNotifier<String> _valueNotifier;

  StarSignStateNotifier(this._sharedPrefs) : super(_sharedPrefs.value?.getString('starSign') ?? 'default') {
    _valueNotifier = ValueNotifier(state);
    _valueNotifier.addListener(() {
      state = _valueNotifier.value;
    });
  }

  Future<void> updateStateFromPrefs() async {
    final prefs = await _sharedPrefs.value;
    final newStarSign = prefs?.getString('starSign') ?? 'default';
    if (newStarSign != state) {
      _valueNotifier.value = newStarSign;
    }
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }
}

final starSignProvider = StateNotifierProvider<StarSignStateNotifier, String>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  final notifier = StarSignStateNotifier(sharedPrefs);
  notifier.updateStateFromPrefs(); // initial state update
  return notifier;
});
