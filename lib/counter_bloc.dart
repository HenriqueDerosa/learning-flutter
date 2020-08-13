import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc extends BlocBase {
  final BehaviorSubject<int> _counterController =
      BehaviorSubject<int>.seeded(0);

  Stream<int> get counterStream => _counterController.stream;
  int get counter => _counterController.value;

  void increment() {
    _counterController.sink.add(_counterController.value + 1);
  }

  @override
  void dispose() {
    super.dispose();
    _counterController.close();
  }
}
