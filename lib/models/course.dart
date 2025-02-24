class Course {
  String name;
  String grade;
  int creditLevel;

  Course({
    required this.name,
    required this.grade,
    required this.creditLevel,
  });

  double getGradePoints() {
    double basePoints;
    switch (grade) {
      case 'A+': basePoints = 4.0; break;
      case 'A': basePoints = 4.0; break;
      case 'A-': basePoints = 3.7; break;
      case 'B+': basePoints = 3.3; break;
      case 'B': basePoints = 3.0; break;
      case 'B-': basePoints = 2.7; break;
      case 'C+': basePoints = 2.3; break;
      case 'C': basePoints = 2.0; break;
      case 'C-': basePoints = 1.7; break;
      case 'D+': basePoints = 1.3; break;
      case 'D': basePoints = 1.0; break;
      case 'F': basePoints = 0.0; break;
      default: basePoints = 0.0;
    }
    return basePoints * creditLevel;
  }
}