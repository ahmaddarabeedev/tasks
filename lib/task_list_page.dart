import 'package:flutter/material.dart';

import 'completed_tasks_page.dart';
import 'task.dart';
import 'task_item.dart';

/// Main page: shows all tasks, the completed counter, and a navigation button.
class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final List<Task> _tasks = [
    const Task(title: 'Buy groceries'),
    const Task(title: 'Finish homework', isCompleted: true),
    const Task(title: 'Call mom'),
    const Task(title: 'Pay bills', isCompleted: true),
  ];

  int get _completedCount => _tasks.where((task) => task.isCompleted).length;

  void _onTaskChanged(int index, bool? isCompleted) {
    setState(() {
      _tasks[index] = _tasks[index].copyWith(
        isCompleted: isCompleted ?? false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Completed: $_completedCount / ${_tasks.length}'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return TaskItem(
                  task: _tasks[index],
                  onChanged: (value) => _onTaskChanged(index, value),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompletedTasksPage(
                      tasks: _tasks
                          .where((task) => task.isCompleted)
                          .toList(),
                    ),
                  ),
                );
              },
              child: const Text('View Completed Tasks'),
            ),
          ),
        ],
      ),
    );
  }
}