part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: (state is AuthHasToken)
                  ? Column(
                      children: [
                        Center(
                          child: Text(state.token),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 45,
                          width: 200,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text('Logout',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                            onPressed: () {
                              context.read<AuthBloc>().add(OnLogOut());
                            },
                          ),
                        )
                      ],
                    )
                  : SizedBox());
        },
      ),
    );
  }
}
