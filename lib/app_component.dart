import 'package:angular/angular.dart';
import 'package:angular_app/src/services/hero_service.dart';
import 'package:angular_app/src/services/select_hero_service.dart';
import 'src/data/hero.dart';
import 'src/hero_component.dart';
import 'src/heroes_list/heroes_list_component.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [coreDirectives, HeroComponent, HeroesListComponent],
  providers: [HeroService, ClassProvider(SelectHeroService)],
)
@Injectable()
class AppComponent implements OnInit {
  final title = 'Tour of Heroes';
  final HeroService _heroService;

  List<Hero> heroes;
  Hero selected;

  AppComponent(this._heroService);

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }

  ngOnInit() => _getHeroes();
}
