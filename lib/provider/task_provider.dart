import 'package:flutter/material.dart';
import 'package:to_do/features/home/model/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final List<TaskModel> _tasks = [];

  TaskProvider() {
    _addDefaultTasks();
  }

  // ================= Default tasks =====================
  void _addDefaultTasks() {
    _tasks.addAll([
      TaskModel(
        title: "Welcome Task",
        description: "This is your first task. Tap to manage it.",
        isCompleted: false,
        imagePath: null,
      ),
      TaskModel(
        title: "Add a new task",
        description: "Tap the + button to add your own tasks.",
        isCompleted: false,
        imagePath: null,
      ),
    ]);
  }

  ///============= Public read-only list ==================
  List<TaskModel> get tasks => List.unmodifiable(_tasks);

  void addTask(String title, String description, {String? imagePath}) {
    final task = TaskModel(
      title: title,
      description: description,
      imagePath: imagePath,
      isCompleted: false,
    );
    _tasks.add(task);
    notifyListeners();
  }

  //========== Toggle checkbox state =================
  void toggleTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
      notifyListeners();
    }
  }

  /// Delete task
  void removeTaskAt(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
      notifyListeners();
    }
  }

  /// ========== delete task by title ===========
  void removeTaskByTitle(String title) {
    _tasks.removeWhere((task) => task.title == title);
    notifyListeners();
  }

  /// Optional: clear all tasks (future use)
  void clearTasks() {
    _tasks.clear();
    notifyListeners();
  }
}
