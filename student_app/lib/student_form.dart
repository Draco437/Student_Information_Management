import 'package:flutter/material.dart';
import 'api_service.dart';
import 'student_model.dart';
import 'student_list.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cgpaController = TextEditingController();

  Future<void> submitStudent() async {
    Student student = Student(
      name: nameController.text,
      rollNo: rollController.text,
      email: emailController.text,
      cgpa: cgpaController.text,
    );

    bool success = await ApiService.addStudent(student);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Student Added Successfully"),
        ),
      );

      nameController.clear();
      rollController.clear();
      emailController.clear();
      cgpaController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to Add Student"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Information System"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: rollController,
              decoration: const InputDecoration(
                labelText: "Roll Number",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: cgpaController,
              decoration: const InputDecoration(
                labelText: "CGPA",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: submitStudent,
              child: const Text("Submit"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StudentList(),
                  ),
                );
              },
              child: const Text("Show Details"),
            ),
          ],
        ),
      ),
    );
  }
}