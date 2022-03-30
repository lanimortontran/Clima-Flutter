import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future<Map<String, dynamic>> getData() async {
    print('getting data...');
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      print(response.statusCode);
    }
  }
}
