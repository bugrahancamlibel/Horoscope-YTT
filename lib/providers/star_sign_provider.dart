import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final starSignProvider = FutureProvider((ref) async {
  final prefs = await SharedPreferences.getInstance();
  String yourSign = prefs.getString('starSign') ?? "unknown";
  return yourSign;
});
