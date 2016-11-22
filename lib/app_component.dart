import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular_dart_page_titles_on_route/page/fields_component.dart';
import 'package:angular_dart_page_titles_on_route/page/player_detail_component.dart';
import 'package:angular_dart_page_titles_on_route/page/players_component.dart';
import 'package:angular_dart_page_titles_on_route/page/teams_component.dart';

@Component(
    selector: 'my-app',
    styleUrls: const ['app_component.css'],
    templateUrl: 'app_component.html',
    directives: const [ROUTER_DIRECTIVES],
    providers: const [ROUTER_PROVIDERS]
)
@RouteConfig(const [
  const Route(path: '/players', name: 'Players', component: PlayersComponent, useAsDefault: true),
  const Route(path: '/teams', name: 'Teams', component: TeamsComponent),
  const Route(path: '/fields', name: 'Fields', component: FieldsComponent),
  const Route(path: '/player/:id', name: 'PlayerDetail', component: PlayerDetailComponent),
])
class AppComponent {}
