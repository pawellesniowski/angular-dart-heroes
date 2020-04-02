import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_app/src/data/hero.dart';
import 'package:angular_app/src/services/hero_service.dart';
import 'package:angular_app/src/services/select_hero_service.dart';
import 'heroes_list_item_component.dart';

@Component(
  selector: 'heroes-list',
  template: '''
  <h2>Heroes</h2>
  <ul>
    <heroes-list-item 
      *ngFor="let hero of heroes" 
      [hero]="hero" 
      [selectedHero]="selectedHero"
>
    </heroes-list-item>
  </ul>
  ''',
  styleUrls: ['heroes_list_component.css'],
  directives: [coreDirectives, HeroesListItemComponent],
  providers: [HeroService],
)
class HeroesListComponent implements OnInit, OnDestroy{
  final HeroService _heroService;
  List<Hero> heroes;

  final SelectHeroService _selectHeroService;
  StreamSubscription<Hero> _streamSubscription;
  Hero selectedHero;

  HeroesListComponent(this._heroService, this._selectHeroService);

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAllSlow();
  }

  @override
  void ngOnInit() {
    _getHeroes();
    _streamSubscription = _selectHeroService
        .stream
        .listen((hero) => selectedHero = hero);
  }

  @override
  void ngOnDestroy() {
    _streamSubscription.cancel();
  }

}
