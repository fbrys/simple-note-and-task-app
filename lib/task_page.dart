import 'package:flutter/material.dart';
import 'add_task.dart'; // Mengubah import ke AddTaskPage

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<String> tasks = []; // Mengubah variabel "notes" menjadi "tasks"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'), // Mengubah judul halaman
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
        itemCount: tasks.length, // Mengubah jumlah item menjadi tasks.length
        itemBuilder: (context, index) {
          final task = tasks[index]; // Mengubah variabel "note" menjadi "task"
          return ListTile(
            title: Text(task), // Mengubah teks menjadi task
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _showDeleteConfirmationDialog(context, index);
              },
            ),
            onTap: () async {
              final editedTask = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddTaskPage(
                        task: task)), // Mengirimkan task sebagai argumen
              );
              if (editedTask != null) {
                setState(() {
                  tasks[index] = editedTask;
                });
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddTaskPage(
                    task: '')), // Mengirimkan task kosong sebagai argumen
          );
          if (newTask != null) {
            setState(() {
              tasks.add(newTask);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Task"), // Mengubah judul dialog
          content: Text("Are you sure you want to delete this task?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasks.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
