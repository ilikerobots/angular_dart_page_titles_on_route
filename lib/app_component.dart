import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/browser.dart';
import 'package:angular_dart_page_titles_on_route/page/fields_component.dart';
import 'package:angular_dart_page_titles_on_route/page/player_detail_component.dart';
import 'package:angular_dart_page_titles_on_route/page/players_component.dart';
import 'package:angular_dart_page_titles_on_route/page/teams_component.dart';
import 'package:angular_dart_page_titles_on_route/title_set_component.dart';


@Component(
    selector: 'my-app',
    styleUrls: const ['app_component.css'],
    templateUrl: 'app_component.html',
    directives: const [ROUTER_DIRECTIVES],
    providers: const [
      ROUTER_PROVIDERS,
      const Provider(Title, useClass: Title),
      TitleSetService,
    ]
)
@RouteConfig(const [
  const Route(path: '/players', name: 'Players', component: PlayersComponent, useAsDefault: true),
  const Route(path: '/teams', name: 'Teams', component: TeamsComponent),
  const Route(path: '/fields', name: 'Fields', component: FieldsComponent, data: const{'title': 'Ballparks'}),
  const Route(path: '/player/:id', name: 'PlayerDetail', component: PlayerDetailComponent,
      data: const{'title': 'Player'}),
])
class AppComponent {

  AppComponent(TitleSetService _titleSet) {
    _titleSet.nameStrategy = _setTitle;
  }

  String _setTitle(ComponentInstruction c) {
    StringBuffer sb = new StringBuffer();
    sb.write("Title Set Demo | ");

    if (c.routeData.data.containsKey('title')) { // if title is in data, use it
      sb.write(c.routeData.data['title']);
    } else { //otherwise use route name
      sb.write(c.routeName);
    }

    if (c.params.containsKey('id')) { // if detail id in params, append it
      sb.write(": ${c.params['id']}");
    }
    return sb.toString();
  }


}
