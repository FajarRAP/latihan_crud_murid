import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_crud_murid/services.dart';
import 'presentation/bloc/murid_bloc.dart';
import 'presentation/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MuridBloc(ToDoServices()),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
