part of 'murid_bloc.dart';

@immutable
sealed class MuridState {}

final class MuridInitial extends MuridState {}

final class MuridLoading extends MuridState {}

final class MuridLoaded extends MuridState {
  final List<Murid> murid;
  MuridLoaded(this.murid);
}

final class MuridSending extends MuridState {}

final class MuridSended extends MuridState {}
