import 'package:flutter/material.dart';

class EditTask extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String) editTask;

  const EditTask({
    Key? key,
    required this.textEditingController,
    required this.editTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Task'),
      content: TextField(
        controller: textEditingController,
        onChanged: (value) {
          editTask(value);
        },
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            editTask(textEditingController.text);
            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
