part of 'murid_bloc.dart';

@immutable
sealed class MuridState {}

final class MuridInitial extends MuridState {}

class MuridLoading extends MuridState {}

class MuridLoaded extends MuridState {
  final List<Murid> murid;
  MuridLoaded(this.murid);
}

class MuridSending extends MuridState {}

class MuridSended extends MuridState {}

class MuridEditing extends MuridState {}

class MuridEdited extends MuridState {}
