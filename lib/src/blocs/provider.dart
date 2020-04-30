/**
 * this is what makes the bloc -- single instance scoped
 * the context here is like the location of the widget amound all other widgets
 */
import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  // this sets the provider of the sigle global instance to the values we provide
  Provider({Key key, Widget child}): super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType as Provider).bloc;
  }
}

// import the dart bloc
// use this provider class to build widgets that depends on this bloc
// import the main bloc provider to build the widget the depends on the bloc
// create provider context of the bloc in the widget, use the bloc data in widget