part of 'pages.dart';

class MainPage extends StatelessWidget {
  final User user;

  MainPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(user.name),
        ),
      ),
    );
  }
}