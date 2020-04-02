import 'dart:async';
import 'package:angular_app/src/data/hero.dart';

class NumberCreator {
  NumberCreator() {
    Timer.periodic(Duration(seconds: 1), (t){
      _controller.sink.add(_count);
      _count++;
    });
  }

  var _count = 0;

  final _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;
}

//final myStrim = NumberCreator().stream;
//
//final subscription = myStrim.listen(
//    (data) => print('Data: $data')
//);

class SelectedHero {
  SelectedHeroStream() {
    _controller.sink.add(_selectedHero);
  }
  var _selectedHero;

  static final _controller = StreamController<Hero>();

  Stream<Hero> get stream => _controller.stream;
  sink (hero) => _controller.sink;
}
