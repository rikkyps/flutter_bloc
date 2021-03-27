import 'package:flutter/material.dart';
import 'package:flutter_auth_bloc/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './ui/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (_) => UserBloc(),
        ),
      ], child: LoginPage()),
    );
  }
}
