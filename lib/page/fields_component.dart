import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/browser.dart' show Title;

@Component(
    selector: 'my-fields',
    template: '<h2>Fields</h2>',
    )
class FieldsComponent implements OnActivate {
  final Title _titleService;

  FieldsComponent(this._titleService);

  @override
  void routerOnActivate(ComponentInstruction nextInstruction, ComponentInstruction prevInstruction) {
    _titleService.setTitle("List of Fields");
  }
}