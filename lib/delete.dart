import 'package:flutter/material.dart';

class DeleteTask extends StatelessWidget {
  final Function() removeTask;

  const DeleteTask({
    Key? key,
    required this.removeTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: removeTask,
    );
  }
}
