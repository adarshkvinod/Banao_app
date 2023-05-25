// To parse this JSON data, do
//
//     final lessons = lessonsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Lessons lessonsFromJson(String str) => Lessons.fromJson(json.decode(str));

String lessonsToJson(Lessons data) => json.encode(data.toJson());

class Lessons {
  final String requestId;
  final List<Item> items;
  final int count;
  final String anyKey;

  Lessons({
    required this.requestId,
    required this.items,
    required this.count,
    required this.anyKey,
  });

  factory Lessons.fromJson(Map<String, dynamic> json) => Lessons(
    requestId: json["requestId"]??"",
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    count: json["count"]??"",
    anyKey: json["anyKey"]??"",
  );

  Map<String, dynamic> toJson() => {
    "requestId": requestId,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "count": count,
    "anyKey": anyKey,
  };
}

class Item {
  final DateTime createdAt;
  final String name;
  final int duration;
  final String category;
  final bool locked;
  final String id;

  Item({
    required this.createdAt,
    required this.name,
    required this.duration,
    required this.category,
    required this.locked,
    required this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    createdAt: DateTime.parse(json["createdAt"]),
    name: json["name"]??"",
    duration: json["duration"]??0,
    category: json["category"]??"",
    locked: json["locked"]??false,
    id: json["id"]??"",
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "name": name,
    "duration": duration,
    "category": category,
    "locked": locked,
    "id": id,
  };
}
