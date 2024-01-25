import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/murid_model.dart';
import '../bloc/murid_bloc.dart';
import '../pages/detail_page.dart';

class ItemMurid extends StatelessWidget {
  final String nama;
  final String nim;
  const ItemMurid({
    super.key,
    required this.nama,
    required this.nim,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(nama),
      subtitle: Text(nim),
      trailing: Container(
        width: 70,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Center(
          child: Text(
            "HADIR",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) =>
                DetailMurid(murid: Murid(nim: nim, nama: nama))),
      ),
    );
  }
}
