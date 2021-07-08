import 'package:flutter/material.dart';
import 'package:places/src/core/provider_setup.dart';
import 'package:places/src/screens/auth/login_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: providers,
      child: MaterialApp(
          title: "Places",
          theme: ThemeData.light(),
          home: LoginScreen(),
      ),
    );
  }
}
