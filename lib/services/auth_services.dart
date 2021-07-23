part of 'services.dart';

class AuthServices {
  static Future<ApiReturnValue<User>> login(String _email, String _password,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String endPoint = baseURL + 'login';
    var response = await http.post(endPoint,
        headers: {'Content-type': 'application/json'},
        body: jsonEncode({'email': _email, 'password': _password}));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Login gagal');
    }

    var data = jsonDecode(response.body);
    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue> logOut(String token,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String endPoint = baseURL + 'logout';
    var response = await client.post(endPoint, headers: {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode != 200) {
      ApiReturnValue(message: 'Logout gagal!');
    }

    var data = jsonDecode(response.body);
    return ApiReturnValue(value: data['data']);
  }

  static Future hasToken() async {
    Future<SharedPreferences> _pref = SharedPreferences.getInstance();
    final SharedPreferences local = await _pref;
    final String token = local.getString('access_token') ?? null;
    if (token != null) {
      return token;
    } else {
      return null;
    }
  }

  static Future setAccessToken(String token) async {
    Future<SharedPreferences> _pref = SharedPreferences.getInstance();
    final SharedPreferences local = await _pref;
    local.setString('access_token', token);
  }

  static Future unSetAccessToken() async {
    Future<SharedPreferences> _pref = SharedPreferences.getInstance();
    final SharedPreferences local = await _pref;
    local.setString('access_token', null);
  }
}
