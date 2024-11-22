import 'dart:convert';

import 'package:http/http.dart' as http;
Future<List<String>> fetchDataMethod()async{
  var client = http.Client();
  List<String> facts;
try {
  var response = await client.get(
      Uri.parse('https://cat-fact.herokuapp.com/facts'),
      );
      print(response.body);
      
 var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
   facts = decodedResponse.map((fact) {
        if (fact is Map<String, dynamic>) {
          return fact['text'] as String;
        }
        return '';
      }).where((text) => text.isNotEmpty).toList();

  print(facts);
} finally {
  client.close();
}
  return facts;
}