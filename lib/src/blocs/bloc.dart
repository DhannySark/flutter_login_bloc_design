import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {
  /// Object here has all the properties of dart classes
  /// define the stream controller with types to handle data the goes into come out of the stream
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // adding || handling data in stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => 
      Observable.combineLatest2(email, password, (e, p) => true);

  // change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('email is $validEmail and password is $validPassword');
  }

  displose() {
    _email.close();
    _password.close();
  }
}

// use this when you want to create a global instance for the bloc
// final bloc = new Bloc();