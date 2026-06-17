class Student {
  String name;
  String rollNo;
  String email;
  String cgpa;

  Student({
    required this.name,
    required this.rollNo,
    required this.email,
    required this.cgpa,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'],
      rollNo: json['roll_no'],
      email: json['email'],
      cgpa: json['cgpa'].toString(),
    );
  }

  Map<String, String> toJson() {
    return {
      'name': name,
      'roll_no': rollNo,
      'email': email,
      'cgpa': cgpa,
    };
  }
}