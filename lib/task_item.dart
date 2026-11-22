import 'package:flutter/material.dart';

import 'task.dart';

/// Reusable list item that shows a task title and a checkbox.
class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
    this.onChanged,
  });

  final Task task;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: onChanged,
      ),
      title: Text(task.title),
    );
  }
}