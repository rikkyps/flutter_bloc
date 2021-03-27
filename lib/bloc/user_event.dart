part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class DoSignIn extends UserEvent {
  final String email;
  final String password;

  DoSignIn(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
