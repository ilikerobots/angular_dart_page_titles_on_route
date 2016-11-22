import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/browser.dart' show Title;

@Component(
    selector: 'my-teams',
    template: '<h2>Teams</h2>',
)
class TeamsComponent implements OnActivate {
  final Title _titleService;

  TeamsComponent(this._titleService);

  @override
  void routerOnActivate(ComponentInstruction nextInstruction, ComponentInstruction prevInstruction) {
    _titleService.setTitle("List of Teams");
  }
}