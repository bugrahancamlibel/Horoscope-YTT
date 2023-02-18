import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_ytt/providers/star_sign_provider.dart';
import 'package:http/http.dart' as http;
import '../model.dart';

final HoroscopeProvider = FutureProvider.family<HoroscopeModel, String>((ref, day) async {
  final starSignConsumer = ref.watch(starSignProvider);

  String apiUrl =
      'https://aztro.sameerkumar.website/?sign=${starSignConsumer}&day=$day';
  try {
    http.Response response = await http.post(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      print("oh its 200");
      return HoroscopeModel.fromJson(jsonDecode(response.body));
    } else {
      return HoroscopeModel(
          dateRange: "dateRange",
          currentDate: "currentDate",
          description: "description",
          compatibility: "compatibility",
          mood: "mood",
          color: "color",
          luckyNumber: "luckyNumber",
          luckyTime: "luckyTime");
    }
  } catch (e) {
    print('Exception occured: $e');
    return HoroscopeModel(
        dateRange: "dateRange",
        currentDate: "currentDate",
        description: "description",
        compatibility: "compatibility",
        mood: "mood",
        color: "color",
        luckyNumber: "luckyNumber",
        luckyTime: "luckyTime");
  }
});
