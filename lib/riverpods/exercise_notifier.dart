import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insane_gainz/models/master_exercise.dart';

class ExerciseNotifier extends StateNotifier<List<String>> {
  ExerciseNotifier()
      : super([
          "Bench Press",
          "Deadlift",
          "Overhead Press",
          "Pullup",
          "Power clean"
        ]);

  void delete(int i) {
    state = [...state]..removeAt(i);
  }

  void add(MasterExercise e) {
    state = [...state]..add(e.getName());
  }
}
