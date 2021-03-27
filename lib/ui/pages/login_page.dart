part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome! please login'),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: TextField(controller: email),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: TextField(obscureText: true, controller: password),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: (isLoading)
                    ? SpinKitFadingCircle(
                        color: Colors.amber,
                        size: 50,
                      )
                    : RaisedButton(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.amber,
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          context.read<UserBloc>().add(DoSignIn(email.text, password.text));
                          UserState state = context.read<UserBloc>().state;

                          if (state is UserLoaded) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage(state.user)),
                            );
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                      ),
              )
            ],
          )
        ],
      ),
    );
  }
}
