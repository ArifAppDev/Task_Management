class TaskModel {
  final String title;
  final String description;
  final String? imagePath;
  bool isCompleted;

  TaskModel({
    required this.title,
    required this.description,
    this.imagePath,
    this.isCompleted = false,
  });
}
