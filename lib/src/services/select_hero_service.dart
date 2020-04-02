import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_app/src/data/hero.dart';

@Injectable()
class SelectHeroService {
  final _controller = StreamController<Hero>();
  Stream<Hero> get stream => _controller.stream.asBroadcastStream();
  void updateSelectedHero(Hero hero) {
    print(hero.name);
    _controller.sink.add(hero);
  }
}
