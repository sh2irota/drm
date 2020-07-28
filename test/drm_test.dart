import 'package:drm/drm.dart';
import 'package:test/test.dart';

void main() {
  group('Success pattern.', () {
    setUp(() {
      // not implement.
    });

    test('Encrypt', () {
      var text = 'kccs';
      var password = 'kccskccs20200920';
      var actual = Drm.encrypt(text, password);
      expect(actual.endsWith('=='), isTrue);
      expect(actual.length == 24, isTrue);
    });

    test('Decrypt', () {
      var encryptedText =
          '+8Zeupjpr3Dm60B20GND+h3dmEA7qkvkBSI/OJq3cAEcRmcI24pmPFAeXrAjntZn';
      var password = 'kccskccs20200920';
      var actual = Drm.decrypt(password, encryptedText);
      expect(actual, 'KYOCERA Communication Systems Co., Ltd.');
    });
  });
}
