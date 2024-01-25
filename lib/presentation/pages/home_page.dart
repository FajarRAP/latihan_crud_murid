import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_crud_murid/data/models/murid_model.dart';
import 'package:latihan_crud_murid/presentation/bloc/murid_bloc.dart';
import '../widgets/item_murid_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MuridBloc muridBloc = context.read<MuridBloc>();
    final TextEditingController namaController = TextEditingController();
    final TextEditingController nimController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("CRUD Murid")),
      body: RefreshIndicator(
        onRefresh: () async => muridBloc.add(ReadMuridEvent()),
        child: BlocBuilder<MuridBloc, MuridState>(
          bloc: muridBloc..add(ReadMuridEvent()),
          builder: (context, state) {
            print(state);
            if (state is MuridLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MuridLoaded) {
              final List<Murid> murid = state.murid;
              return ListView(
                  children: murid
                      .map((e) => ItemMurid(nama: e.nama, nim: e.nim))
                      .toList());
            } else if (state is MuridSended) {
              muridBloc.add(ReadMuridEvent());
            }
            return Center(
              child: ElevatedButton(
                onPressed: () => muridBloc.add(ReadMuridEvent()),
                child: const Text("Ulangi"),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Tambah Data Murid"),
                content: SizedBox(
                  height: 120,
                  child: Column(
                    children: [
                      TextField(
                        controller: nimController,
                        decoration: const InputDecoration(
                          hintText: "NIM",
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: namaController,
                        decoration: const InputDecoration(
                          hintText: "Nama",
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Kembali"),
                  ),
                  TextButton(
                    onPressed: () {
                      String nim = nimController.text;
                      String nama = namaController.text;
                      if (nim.isEmpty || nama.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Mohon isi semua data")));
                      } else {
                        muridBloc.add(CreateMuridEvent(nim: nim, nama: nama));
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text("Kirim"),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
