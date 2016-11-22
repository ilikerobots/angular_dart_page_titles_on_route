import 'package:angular2/core.dart';
import 'package:angular2/platform/browser.dart';
import 'package:angular_dart_page_titles_on_route/app_component.dart';

void main() {
  bootstrap(AppComponent, [
    provide(Title, useFactory: () => new Title(), deps: const[])
  ]);
}
