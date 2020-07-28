import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/api.dart';
import 'package:pointycastle/block/aes_fast.dart';
import 'package:pointycastle/paddings/pkcs7.dart';
import 'package:pointycastle/padded_block_cipher/padded_block_cipher_impl.dart';
import 'package:pointycastle/block/modes/ecb.dart';

class Drm {
  static String encrypt(String text, var passKey) {
    var key = Uint8List.fromList(
      utf8.encode(passKey),
    );

    PaddedBlockCipher cipher = PaddedBlockCipherImpl(
      PKCS7Padding(),
      ECBBlockCipher(AESFastEngine()),
    );

    cipher.init(
      true,
      PaddedBlockCipherParameters<CipherParameters, CipherParameters>(
        KeyParameter(key),
        null,
      ),
    );

    var encodedText = utf8.encode(text);
    var bytes = cipher.process(encodedText);
    return base64.encode(bytes);
  }

  static String decrypt(var passKey, var text) {
    var key = Uint8List.fromList(
      utf8.encode(passKey),
    );
    PaddedBlockCipher cipher = PaddedBlockCipherImpl(
      PKCS7Padding(),
      ECBBlockCipher(AESFastEngine()),
    );

    cipher.init(
      false,
      PaddedBlockCipherParameters<CipherParameters, CipherParameters>(
        KeyParameter(key),
        null,
      ),
    );
    var txt = base64.decode(text);
    var byte = cipher.process(txt);
    return String.fromCharCodes(byte);
  }
}
