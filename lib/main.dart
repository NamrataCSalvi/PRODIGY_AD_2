import 'package:flutter/material.dart';
import 'add.dart';
import 'edit.dart';
import 'delete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const ToDoList(),
    );
  }
}

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _tasks = [];

  void _addTask(String task) {
    setState(() {
      _tasks.add(task);
    });
    _textEditingController.clear();
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _editTask(int index, String editedTask) {
    setState(() {
      _tasks[index] = editedTask;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 255, 207),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 193, 233, 248),
        title: const Center(
          child: Text(
            'To-Do List App',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black), // Border color
              borderRadius: BorderRadius.circular(8.0), // Border radius
            ),
            child: AddTask(
              textEditingController: _textEditingController,
              addTask: _addTask,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white, // White color for the background
                    borderRadius: BorderRadius.circular(8.0), // Border radius
                  ),
                  child: ListTile(
                    title: Text('${index + 1}. ${_tasks[index]}'), // Numbering for tasks
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return EditTask(
                                  textEditingController: TextEditingController(text: _tasks[index]),
                                  editTask: (editedTask) {
                                    _editTask(index, editedTask);
                                  },
                                );
                              },
                            );
                          },
                        ),
                        DeleteTask(
                          removeTask: () {
                            _removeTask(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
