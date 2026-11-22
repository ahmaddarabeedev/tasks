
class Task {
  const Task({
    required this.title,
    this.isCompleted = false,
  });

  final String title;
  final bool isCompleted;

  Task copyWith({bool? isCompleted}) {
    return Task(
      title: title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}