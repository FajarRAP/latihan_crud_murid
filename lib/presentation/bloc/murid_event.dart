part of 'murid_bloc.dart';

@immutable
sealed class MuridEvent {}

class ReadMuridEvent extends MuridEvent {}

class CreateMuridEvent extends MuridEvent {
  final String nim;
  final String nama;

  CreateMuridEvent({required this.nim, required this.nama});
}

class EditMuridEvent extends MuridEvent {
  final Murid murid;

  EditMuridEvent({required this.murid});
}

class DeleteMuridEvent extends MuridEvent {
  final String nim;

  DeleteMuridEvent({required this.nim});
}
