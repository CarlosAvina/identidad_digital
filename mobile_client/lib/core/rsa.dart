import 'dart:convert';

import 'package:simple_rsa/simple_rsa.dart';

final publicKey = '...';
final privateKey = '...';

encryptJson(String encryptedJson) async {
  final decryptedText = await decryptString(
      encryptedJson, utf8.decode(base64.decode(privateKey)));

  // Test
  // print(json == decryptedText ? 'true' : 'false');
}
