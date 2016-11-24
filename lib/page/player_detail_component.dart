import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

@Component(
    selector: 'my-player-detail',
    template: '''<h2>Player Detail</h2> <h3>{{player}}</h3>''',
)
class PlayerDetailComponent implements OnInit {
  final RouteParams _routeParams;
  String player = "Unknown";

  PlayerDetailComponent(this._routeParams);

  void ngOnInit() {
    player = _routeParams.get('id');
  }

}