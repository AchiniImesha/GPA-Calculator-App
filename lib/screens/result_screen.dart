import 'package:flutter/material.dart';
import '../models/course.dart';

class ResultScreen extends StatelessWidget {
  final List<Course> courses;

  const ResultScreen({super.key, required this.courses});

  double calculateGPA() {
    if (courses.isEmpty) return 0.0;
    double totalPoints = 0;
    int totalCredits = 0;
    
    for (var course in courses) {
      totalPoints += course.getGradePoints();
      totalCredits += course.creditLevel;
    }
    
    return totalCredits > 0 ? totalPoints / totalCredits : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final gpa = calculateGPA();

    return Scaffold(
      appBar: AppBar(
        title: const Text('GPA Result'),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const Text(
                        'Your GPA is',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        gpa.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF41849A),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Total Credits: ${courses.fold(0, (sum, course) => sum + course.creditLevel)}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}