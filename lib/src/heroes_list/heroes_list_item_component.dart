import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_app/src/data/hero.dart';
import 'package:angular_app/src/services/select_hero_service.dart';

@Component(
  selector: 'heroes-list-item',
  template: '''
  <li 
    class="heroes-list-item"
    [class.selected]="hero === selectedHero"
    (click)="handleListItemClick"
  >
    <span class="badge">{{hero.id}}</span> {{hero.name}}
  </li>
  ''',
  styleUrls: ['heroes_list_item_component.css'],
)
@Injectable()
class HeroesListItemComponent implements OnDestroy {
  @Input()
  Hero hero;
  @Input()
  Hero selectedHero;

  final SelectHeroService _selectHeroService;
  StreamSubscription<Hero> _streamSubscription;

  HeroesListItemComponent(this._selectHeroService);


  void handleListItemClick () {
    print('item ${hero.id}');
    _selectHeroService.updateSelectedHero(this.hero);
  }


  @override
  void ngOnDestroy() {
    _streamSubscription.cancel();
  }
}
