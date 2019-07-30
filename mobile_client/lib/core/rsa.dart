import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simple_rsa/simple_rsa.dart';

// final publicKey = '...';
// final privateKey = '...';
class RSA {
  RSA({Key key});

  encryptJson(String encryptedJson, String nip) async {
    return await decryptString(encryptedJson, nip);

    // return decryptedText;
  }
}
