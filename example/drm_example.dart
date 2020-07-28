import 'package:drm/drm.dart';

void main() {
  var key = '1234567890123456';
  var text = 'kccs';

  var encryptedText = Drm.encrypt(text, key);
  print(encryptedText);
  var decryptedText = Drm.decrypt(key, encryptedText);
  print(decryptedText);
}
