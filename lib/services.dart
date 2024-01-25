import 'dart:convert';

import 'package:http/http.dart' as http;
import 'data/models/murid_model.dart';

class ToDoServices {
  Future<List<Murid>> fetchMurid() async {
    final response = await http
        .get(Uri.parse("http://10.0.2.2/crud_student_flutter_api/read.php"));
    if (response.statusCode == 200) {
      final List<dynamic> responseBody = jsonDecode(response.body);
      final List<Murid> murid = responseBody
          .map((e) => Murid(nama: e["nama"], nim: e["nim"]))
          .toList();
      return murid;
    }
    throw ("Gagal Mengambil Data...");
  }

  Future<void> addMurid(String nim, String nama) async {
    final response = await http.post(
        Uri.parse("http://10.0.2.2/crud_student_flutter_api/create.php"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(Murid(nim: nim, nama: nama).toJson()));
    if (response.statusCode == 200) {
      print("response ${response.body}");
    }
  }

  Future<void> editMurid(Murid murid) async {
    final response = await http.post(
      Uri.parse("http://10.0.2.2/crud_student_flutter_api/edit.php"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(murid.toJson()),
    );
    if (response.statusCode == 200) {
      print("response update ${response.body}");
    }
  }

  Future<void> deleteMurid(String nim) async {
    final response = await http.post(
        Uri.parse("http://10.0.2.2/crud_student_flutter_api/hapus.php"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"nim": nim}));
    if (response.statusCode == 200) {
      print("response delete ${response.body}");
    }
  }
}
