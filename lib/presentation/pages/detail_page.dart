import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/murid_model.dart';
import '../bloc/murid_bloc.dart';

class DetailMurid extends StatelessWidget {
  final Murid murid;
  const DetailMurid({super.key, required this.murid});

  @override
  Widget build(BuildContext context) {
    final MuridBloc muridBloc = context.read<MuridBloc>();
    TextEditingController nimController = TextEditingController();
    TextEditingController namaController = TextEditingController();
    namaController.text = murid.nama;
    nimController.text = murid.nim;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit dan Hapus Murid"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nama",
              ),
            ),
            BlocListener<MuridBloc, MuridState>(
              listener: (context, state) {
                if (state is MuridEdited) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Berhasil Edit")));
                  muridBloc.add(ReadMuridEvent());
                } else if (state is MuridDeleted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Berhasil Hapus")));
                  muridBloc.add(ReadMuridEvent());
                }
              },
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () => muridBloc.add(
                              EditMuridEvent(
                                  murid: Murid(
                                      nim: murid.nim,
                                      nama: namaController.text)),
                            ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber),
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        )),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        muridBloc.add(DeleteMuridEvent(nim: murid.nim));
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text(
                        "Hapus",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
