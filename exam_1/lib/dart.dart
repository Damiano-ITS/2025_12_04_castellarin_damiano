class Exercise {
  String name;
  int score;
  DateTime submittedAt;

  Exercise({
    required this.name,
    required this.score,
    required this.submittedAt,
  });


  bool get isPassed {
    if (score >= 60) {
      return true;
    } else {
      return false;
    }
  }
}


List<Exercise> passedOnly(List<Exercise> exercise) {
  List<Exercise> passedList = [];

  for (int i = 0; i < exercise.length; i++) {
    
    if (exercise[i].isPassed == true) {
      passedList.add(exercise[i]);
    }
  }

  return passedList;
}


double? averageScore(List<Exercise> exercise) {
  double somma = 0;

  for (int i = 0; i < exercise.length; i++) {
    somma = somma + exercise[i].score;
  }

  return somma / exercise.length;
}


String bestStudent(List<Exercise> exercise) {
int bestScore = -1;
String bestName = "";

  for (int i = 0; i < exercise.length; i++) {
    
    if (exercise[i].score > bestScore) {
      bestScore = exercise[i].score;
      bestName = exercise[i].name;
    }
  }

  return bestName;
}