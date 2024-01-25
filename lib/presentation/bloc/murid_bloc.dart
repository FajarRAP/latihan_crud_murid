import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:latihan_crud_murid/data/models/murid_model.dart';
import 'package:latihan_crud_murid/services.dart';
import 'package:meta/meta.dart';

part 'murid_event.dart';
part 'murid_state.dart';

class MuridBloc extends Bloc<MuridEvent, MuridState> {
  final ToDoServices toDoServices;
  MuridBloc(this.toDoServices) : super(MuridInitial()) {
    on<ReadMuridEvent>(_readMuridEvent);
    on<CreateMuridEvent>(_createMuridEvent);
    on<EditMuridEvent>(_editMuridEvent);
  }

  FutureOr<void> _readMuridEvent(
    ReadMuridEvent event,
    Emitter<MuridState> emit,
  ) async {
    emit(MuridLoading());
    final List<Murid> murid = await toDoServices.fetchMurid();
    emit(MuridLoaded(murid));
  }

  FutureOr<void> _createMuridEvent(
    CreateMuridEvent event,
    Emitter<MuridState> emit,
  ) async {
    emit(MuridSending());
    await toDoServices.addMurid(event.nim, event.nama);
    emit(MuridSended());
  }

  FutureOr<void> _editMuridEvent(
    EditMuridEvent event,
    Emitter<MuridState> emit,
  ) async {
    emit(MuridEditing());
    await toDoServices.editMurid(event.murid);
    emit(MuridEdited());
  }
}
