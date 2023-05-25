import 'dart:convert';
import 'dart:developer';
import 'package:banao_ui/model/lessonsmodel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class LessonsProvider extends ChangeNotifier {
  Future<Lessons> fetchLessonData() async {
    const url = "https://632017e19f82827dcf24a655.mockapi.io/api/lessons";
    final response = await http.get(Uri.parse(url));
    dynamic value = json.decode(response.body);

    if (response.statusCode == 200) {
      return lessonsFromJson(response.body);
    } else {
      throw Exception();
    }
  }
}
