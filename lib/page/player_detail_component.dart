import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/browser.dart';

@Component(
    selector: 'my-player-detail',
    template: '''<h2>Player Detail</h2> <h3>{{player}}</h3>''',
)
class PlayerDetailComponent implements OnInit {
  final Title _titleService;
  final RouteParams _routeParams;
  String player = "Unknown";

  PlayerDetailComponent(this._titleService, this._routeParams);

  void ngOnInit() {
    player = _routeParams.get('id');
    _titleService.setTitle("Player Detail: $player");
  }

}