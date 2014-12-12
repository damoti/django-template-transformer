import 'package:unittest/unittest.dart';
import 'package:django_template_transformer/transformer.dart';

main() {
  test('translate', () {
    expect(translate('placeholder="{% trans \'Username\' %}"'), 'placeholder="Username"');
    expect(translate('placeholder=\'{% trans "Username" %}\''), "placeholder='Username'");
  });
}
