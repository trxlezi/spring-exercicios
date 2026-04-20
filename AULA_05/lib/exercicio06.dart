import 'package:flutter/material.dart';

void main() {
  runApp(const TaskNotesExerciseApp());
}

class TaskNotesExerciseApp extends StatelessWidget {
  const TaskNotesExerciseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercicio 6 - Notas de Tarefas',
      theme: ThemeData(useMaterial3: false, primarySwatch: Colors.blue),
      home: const TaskNotesPage(),
    );
  }
}

class TaskItem {
  TaskItem({required this.title, this.completed = false});

  final String title;
  bool completed;
}

class TaskNotesPage extends StatefulWidget {
  const TaskNotesPage({super.key});

  @override
  State<TaskNotesPage> createState() => _TaskNotesPageState();
}

class _TaskNotesPageState extends State<TaskNotesPage> {
  bool _showCompleted = false;

  final List<TaskItem> _tasks = [
    TaskItem(title: 'Task 2027-07-09\n18:08:17.34244'),
    TaskItem(title: 'Task 2027-07-09\n18:08:32.13030'),
    TaskItem(title: 'Task 2027-07-09\n18:08:32.69026'),
    TaskItem(title: 'Task 2027-07-09\n18:08:33.70237'),
    TaskItem(title: 'Task 2027-07-09\n18:08:33.52412'),
  ];

  @override
  Widget build(BuildContext context) {
    final visibleTasks = _showCompleted
        ? _tasks.where((task) => task.completed).toList()
        : _tasks.where((task) => !task.completed).toList();

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Kindacode.com')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() => _showCompleted = !_showCompleted);
              },
              child: Text(
                _showCompleted ? 'View Pending Tasks' : 'View Completed Tasks',
              ),
            ),
            const SizedBox(height: 18),
            Text(
              _showCompleted
                  ? 'You have ${visibleTasks.length} completed tasks'
                  : 'You have ${visibleTasks.length} uncompleted tasks',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: visibleTasks.length,
                itemBuilder: (context, index) {
                  final task = visibleTasks[index];
                  return Card(
                    color: const Color(0xFFFFE66D),
                    elevation: 3,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(
                        task.title,
                        style: TextStyle(
                          decoration: task.completed
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Checkbox(
                        value: task.completed,
                        onChanged: (value) {
                          setState(() {
                            task.completed = value ?? false;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAboutDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAboutDialog() {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('App de Notas'),
          content: const Text('Você está no App de Notas de Tarefas'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
