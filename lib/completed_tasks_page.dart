import 'package:flutter/material.dart';

import 'task.dart';
import 'task_item.dart';

/// Second page: displays only the completed tasks.
class CompletedTasksPage extends StatelessWidget {
  const CompletedTasksPage({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Tasks'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskItem(task: tasks[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Tasks'),
            ),
          ),
        ],
      ),
    );
  }
}