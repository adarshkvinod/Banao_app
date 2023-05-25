import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import '../model/programmodel.com.dart';

class ProgramProvider extends ChangeNotifier {
  Future<Programs> fetchProgramData() async {
    const url = "https://632017e19f82827dcf24a655.mockapi.io/api/programs";
    final response = await http.get(Uri.parse(url));
    dynamic value = json.decode(response.body);

    if (response.statusCode == 200) {
      return programsFromJson(response.body);
    } else {
      throw Exception();
    }
  }
}
