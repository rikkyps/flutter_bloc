import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_auth_bloc/models/models.dart';
import 'package:flutter_auth_bloc/services/services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is OnAuthCheck) {
      yield AuthLoading();

      final hasToken = await AuthServices.hasToken();
      if (hasToken != null) {
        yield AuthHasToken(token: hasToken);
      } else {
        yield AuthFailed();
      }
    }

    if (event is OnLogin) {
      yield AuthLoading();

      ApiReturnValue<User> userLogin =
          await AuthServices.login(event.email, event.password);
      if (userLogin.value != null) {
        yield LoginSuccess(user: userLogin.value);

        await AuthServices.setAccessToken(User.token);
        yield AuthHasToken(token: User.token);
      } else {
        yield LoginFailed(error: userLogin.message);
      }
    }

    if (event is OnLogOut) {
      final String token = await AuthServices.hasToken();

      try {
        final ApiReturnValue value = await AuthServices.logOut(token);
        if (value.value == true) {
          await AuthServices.unSetAccessToken();
          yield LoginFailed();
        }
      } catch (e) {}
    }
  }
}
