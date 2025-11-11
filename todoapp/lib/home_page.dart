import 'package:flutter/material.dart';
import 'package:todoapp/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();

  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Todo app", style: TextStyle(color: Colors.white)),
        // elevation: 5,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      hintText: "Enter your todo's title",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Todo todo = Todo(title: titleController.text);
                    setState(() {
                      todos.add(todo);
                      titleController.clear();
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 48),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Checkbox(
                            value: todos[i].isCompleted,
                            onChanged: (isChecked) {
                              setState(() {
                                todos[i].isCompleted = isChecked!;
                              });
                            },
                          ),
                          Text(
                            todos[i].title,
                            style: TextStyle(
                              decoration: todos[i].isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                todos.removeAt(i);
                              });
                            },
                            icon: Icon(Icons.delete),
                          ),

                          IconButton(
                            onPressed: () {
                              TextEditingController updateController =
                                  TextEditingController(text: todos[i].title);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Update"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(controller: updateController),

                                        FilledButton(
                                          onPressed: () {
                                            setState(() {
                                              todos[i].title =
                                                  updateController.text;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Update"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.edit),
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
      ),
    );
  }
}
