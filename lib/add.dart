import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String) addTask;

  const AddTask({
    Key? key,
    required this.textEditingController,
    required this.addTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white, // White color for the background
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: <Widget>[
          const Icon(Icons.playlist_add, color: Colors.grey), // Symbol for task list
          const SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: 'Enter a task',
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  addTask(value);
                }
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              if (textEditingController.text.isNotEmpty) {
                addTask(textEditingController.text);
              }
            },
          ),
        ],
      ),
    );
  }
}
