import "dart:convert";
import 'package:crypto/crypto.dart';

String duSHA256(String input) {
  String salt = 'EOpWsyfiy@R@X#qn17!StJNdZK1fFF8iV6ffN!goZkQt#Jx0';
  var btyes = utf8.encode(input + salt);
  var digest = sha256.convert(btyes);
  return digest.toString();
}
