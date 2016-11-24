import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

@Component(
    selector: 'my-players',
    styles: const ['li { text-decoration: underline; cursor: pointer;}'],
    template: '''
    <h2>Players</h2>
    <ul>
    <li *ngFor="let player of players" (click)="onSelect(player)">{{player}}</li>
    </ul>'''
)
class PlayersComponent {
  final Router _router;

  List<String> players = ["John, Tommy", "Carey, Max", "Nehf, Art", "Brown, Mordecai"];

  PlayersComponent(this._router);

  void onSelect(String player) {
    _router.navigate(['/PlayerDetail', {'id': player}]);
  }

}