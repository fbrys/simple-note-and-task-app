import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  final String? title;
  final String? date;
  final String? description;
  final String? content;

  AddTaskPage(
      {this.title,
      this.date,
      this.description,
      this.content,
      required String task});

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.title ?? '';
    dateController.text = widget.date ?? '';
    descriptionController.text = widget.description ?? '';
    contentController.text = widget.content ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'), // Changed the page title
        backgroundColor: Colors.orangeAccent[100],
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _showDeleteConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Date',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(),
              ),
              maxLines: 8,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save task and close the page
                String newTask =
                    '${titleController.text}\n${dateController.text}\n${descriptionController.text}\n${contentController.text}';
                Navigator.pop(context, newTask);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Task"), // Changed the dialog title
          content: Text("Are you sure you want to delete this task?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Delete task and close the page
                Navigator.pop(context, '');
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
