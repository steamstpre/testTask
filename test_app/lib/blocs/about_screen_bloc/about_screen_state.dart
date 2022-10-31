part of 'about_screen_bloc.dart';

@immutable
abstract class AboutScreenState {}

class AboutScreenInitial extends AboutScreenState {}

class LoadDataAboutState extends AboutScreenState {
  final UserModel model;

  LoadDataAboutState(this.model);
}
