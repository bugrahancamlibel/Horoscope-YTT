import 'dart:convert';

class HoroscopeModel {
  HoroscopeModel({
    required this.dateRange,
    required this.currentDate,
    required this.description,
    required this.compatibility,
    required this.mood,
    required this.color,
    required this.luckyNumber,
    required this.luckyTime,
  });

  final String dateRange;
  final String currentDate;
  final String description;
  final String compatibility;
  final String mood;
  final String color;
  final String luckyNumber;
  final String luckyTime;

  factory HoroscopeModel.fromRawJson(String str) => HoroscopeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HoroscopeModel.fromJson(Map<String, dynamic> json) => HoroscopeModel(
    dateRange: json["date_range"],
    currentDate: json["current_date"],
    description: json["description"],
    compatibility: json["compatibility"],
    mood: json["mood"],
    color: json["color"],
    luckyNumber: json["lucky_number"],
    luckyTime: json["lucky_time"],
  );

  Map<String, dynamic> toJson() => {
    "date_range": dateRange,
    "current_date": currentDate,
    "description": description,
    "compatibility": compatibility,
    "mood": mood,
    "color": color,
    "lucky_number": luckyNumber,
    "lucky_time": luckyTime,
  };
}
