// To parse this JSON data, do
//
//     final hanif = hanifFromJson(jsonString);

import 'dart:convert';

Hanif hanifFromJson(String str) => Hanif.fromJson(json.decode(str));

String hanifToJson(Hanif data) => json.encode(data.toJson());

class Hanif {
  Hanif({
    required this.notes,
  });

  List<Note> notes;

  factory Hanif.fromJson(Map<String, dynamic> json) => Hanif(
        notes: List<Note>.from(json["notes"].map((x) => Note.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notes": List<dynamic>.from(notes.map((x) => x.toJson())),
      };
}

class Note {
  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String title;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
