import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_auth_bloc/models/models.dart';
import 'package:flutter_auth_bloc/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is DoSignIn) {
      ApiReturnValue<User> result = await UserServices.signIn(event.email, event.password);

      if (result.value != null) {
        yield(UserLoaded(result.value));
      } else {
        yield(UserLoadingFailed(result.message));
      }
    }
  }
}
