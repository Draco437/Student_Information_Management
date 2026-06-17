import 'dart:convert';
import 'package:http/http.dart' as http;
import 'student_model.dart';

class ApiService {

  static const String insertUrl =
      "http://localhost/student_api/insert_student.php";

  static const String fetchUrl =
      "http://localhost/student_api/fetch_students.php";

  static Future<bool> addStudent(Student student) async {

    final response = await http.post(
      Uri.parse(insertUrl),
      body: student.toJson(),
    );

    return response.statusCode == 200;
  }

  static Future<List<Student>> getStudents() async {

    final response = await http.get(
      Uri.parse(fetchUrl),
    );

    if (response.statusCode == 200) {

      List data = jsonDecode(response.body);

      return data
          .map((student) => Student.fromJson(student))
          .toList();
    }

    return [];
  }
}