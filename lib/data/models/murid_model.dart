// To parse this JSON data, do
//
//     final murid = muridFromJson(jsonString);

import 'dart:convert';

List<Murid> muridFromJson(String str) =>
    List<Murid>.from(json.decode(str).map((x) => Murid.fromJson(x)));

String muridToJson(List<Murid> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Murid {
  final String nim;
  final String nama;

  Murid({
    required this.nim,
    required this.nama,
  });

  factory Murid.fromJson(Map<String, dynamic> json) => Murid(
        nim: json["nim"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "nim": nim,
        "nama": nama,
      };
}
