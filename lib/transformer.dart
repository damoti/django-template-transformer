import 'package:barback/barback.dart';
import 'dart:async';

class DjangoTranslator extends Transformer {

  final BarbackSettings _settings;

  String get allowedExtensions => ".html";

  DjangoTranslator.asPlugin(this._settings) {

  }

  Future apply(Transform transform) {
    if (_settings.mode.name != 'debug') return new Future.value();
    return transform.primaryInput.readAsString().then((content) {
        var id = transform.primaryInput.id;
        var newContent = translate(content);
        transform.addOutput(new Asset.fromString(id, newContent));
    });
  }

}

String translate(String content) {
  var trans = new RegExp("{% trans (?:'([^']*)'|\"([^\"]*)\") %}");
  return content.replaceAllMapped(trans, (m)=> [m.group(1), m.group(2)].singleWhere((e)=>e!=null));
}
