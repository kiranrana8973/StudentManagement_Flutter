import 'dart:convert';

import '../constants/constants.dart';
import '../model/student.dart';
import 'package:http/http.dart' as http;

class UserAPI {
  Future<List<Student>> getAllStudents() async {
    List<Student> _lstStudents = [];
    var response = await http.get(
      Uri.parse(GET_STUDENT_URL),
      headers: {
        'Authorization': 'Bearer $tokenConstant',
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      _lstStudents = (jsonResponse['data'] as List)
          .map(
            (student) => Student.fromJson(student),
          )
          .toList();
    }
    return _lstStudents;
  }
}
