import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_app/src/data/hero.dart';
import 'package:angular_app/src/data/mock_heroes.dart';

@Injectable()
class HeroService {
  Future<List<Hero>> getAll() async => mockHeroes;
  Future<List<Hero>> getAllSlow () {
    return Future.delayed(Duration(seconds: 1), getAll);
  }
}



