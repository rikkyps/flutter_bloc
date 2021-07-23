import 'dart:convert';
import 'package:flutter_auth_bloc/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'user_services.dart';
part 'auth_services.dart';

String baseURL = 'http://foodmarket-backend.codehater.net/api/';