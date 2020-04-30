import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink) {
      if(value.contains('@')) {
        sink.add(value);
      } else {
        sink.addError('Enter a valid email');
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink) {
      if(value.length > 3) {
        sink.add(value);
      } else {
        sink.addError('Password must be at least 4 characters');
      }
    }
  );
}