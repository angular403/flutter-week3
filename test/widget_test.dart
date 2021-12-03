import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  await getSingleUser(1);
}

Future<void> getSingleUser(int id) async {
  Uri uri = Uri.parse("https://reqres.in/api/users/$id");
  var response = await http.get(uri);
  if (response.statusCode == 200) {
    //ada data
    Map<String, dynamic> resBody = jsonDecode(response.body);
    print(resBody["data"]["email"]);
  } else {
    //belum data
  }
}
