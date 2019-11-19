
import 'dart:async';

class IncreaseBloc {
  int _counter = 0;
  StreamController<int> _streamController = StreamController<int>();
  Stream<int> get stream => _streamController.stream;

  void increase() {
    _counter ++;
    _streamController.sink.add(_counter);
  }

  void dispose () {
    _streamController.close();
  }
}