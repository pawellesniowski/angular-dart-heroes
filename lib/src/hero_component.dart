import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_app/src/services/select_hero_service.dart';
import 'package:angular_forms/angular_forms.dart';

import 'data/hero.dart';

@Component(
selector: 'my-hero',
template: '''
  <div *ngIf="selectedHero != null">
  <h2>{{selectedHero.name}}</h2>
  <div><label>id: </label>{{selectedHero.id}}</div>
  <div><label>name: </label>{{selectedHero.name}}</div>
  <input [(ngModel)]="selectedHero.name" placeholder="name">
  </div>
''',
directives: [coreDirectives, formDirectives],
)
class HeroComponent implements OnInit, OnDestroy{
  final SelectHeroService _selectHeroService;
  StreamSubscription<Hero> _streamSubscription;

  Hero selectedHero;


  HeroComponent(this._selectHeroService);


  @override
  void ngOnInit() {
    _streamSubscription = _selectHeroService
        .stream
        .listen((hero) => selectedHero = hero);
  }

  @override
  void ngOnDestroy() {
    _streamSubscription.cancel();
  }

}
