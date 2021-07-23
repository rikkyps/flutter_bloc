part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthHasToken extends AuthState {
  final String token;

  AuthHasToken({this.token});
  @override
  List<Object> get props => [token];
}

class AuthFailed extends AuthState {}

class AuthData extends AuthState {
  final String name;
  final String email;

  AuthData({this.name, this.email});

  @override
  List<Object> get props => [name, email];
}

class LoginInitial extends AuthState {}

class LoginSuccess extends AuthState {
  final User user;

  LoginSuccess({this.user});

  @override
  List<Object> get props => [user];
}

class LoginFailed extends AuthState {
  final String error;

  LoginFailed({this.error});
  @override
  List<Object> get props => [error];
}
