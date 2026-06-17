import 'package:flutter/material.dart';
import 'api_service.dart';
import 'student_model.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {

  late Future<List<Student>> students;

  @override
  void initState() {
    super.initState();
    students = ApiService.getStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Details"),
      ),
      body: FutureBuilder<List<Student>>(
        future: students,
        builder: (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("Error Loading Data"),
            );
          }

          if (!snapshot.hasData ||
              snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No Students Found"),
            );
          }

          List<Student> studentList =
              snapshot.data!;

          return ListView.builder(
            itemCount: studentList.length,
            itemBuilder: (context, index) {

              Student student =
                  studentList[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(student.name),
                  subtitle: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Roll No: ${student.rollNo}"),
                      Text(
                          "Email: ${student.email}"),
                      Text(
                          "CGPA: ${student.cgpa}"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}