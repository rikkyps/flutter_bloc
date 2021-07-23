import 'package:flutter/material.dart';
import 'package:flutter_auth_bloc/bloc/auth_bloc.dart';
import 'package:flutter_auth_bloc/ui/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthInitial) {
              context.read<AuthBloc>().add(OnAuthCheck());
              return Container(
                color: Colors.white,
                child: SpinKitFadingCircle(
                  color: Colors.blueAccent,
                ),
              );
            }

            if (state is AuthHasToken) {
              return MainPage();
            }

            if (state is AuthFailed || state is LoginFailed) {
              return LoginPage();
            }

            if (state is AuthLoading) {
              return Container(
                  color: Colors.white,
                  child: SpinKitFadingCircle(
                    color: Colors.blueAccent,
                  ));
            }

            return Container(
              color: Colors.white,
            );
          },
        ),
      ),
    );
  }
}
