import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  build(context) {
    return Provider( // this creates a new instance of the bloc for all the widgets
      child: MaterialApp(
        title: 'lOG ME IN',
        home: Scaffold(
          body: LoginScreen(),
        ),
      )
    );
  }
}