import 'dart:async';
import 'package:angular2/core.dart';
import 'package:angular2/platform/browser.dart';
import 'package:angular2/router.dart';

typedef String TitleNamingFunction(ComponentInstruction c);

@Injectable()
class TitleSetService {
  String baseTitle = null;
  TitleNamingFunction nameStrategy;

  Router _router;
  Title _title;

  TitleSetService(@Optional() this._router, @Optional() this._title) {
    nameStrategy = _defaultNameStrategy;
    if (_title != null && _router != null) {
      _router.subscribe(_setTitleFromRoute);
    }
  }

  Future<Null> _setTitleFromRoute(String url) async {
    StringBuffer sb = new StringBuffer();
    if (baseTitle != null) {
        sb.write(baseTitle);
    }

    //identify component instruction from routed url
    ComponentInstruction compInst = (await _router.recognize(url))?.component;
    if (compInst != null) {
      sb.write(" | " + nameStrategy(compInst));
    }

    _title.setTitle(sb.toString());
  }

  String _defaultNameStrategy(ComponentInstruction compInst) {
      return compInst.routeName;
  }

}