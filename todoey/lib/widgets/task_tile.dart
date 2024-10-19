import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final ValueChanged onToggle; // Renamed for clarity
  final VoidCallback longPressCallback;

  const TaskTile(
      {super.key,
      required this.isChecked,
      required this.taskTitle,
      required this.longPressCallback,
      required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: onToggle,
      ),
    );
  }
}
