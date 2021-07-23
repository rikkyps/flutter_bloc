part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class OnAppStated extends AuthEvent {}

class OnAuthCheck extends AuthEvent {}

class OnLogOut extends AuthEvent {}

class OnLogin extends AuthEvent {
  final String email;
  final String password;

  OnLogin({this.email, this.password});

  @override
  List<Object> get props => [email, password];
}
