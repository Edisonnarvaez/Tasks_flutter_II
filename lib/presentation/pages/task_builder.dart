import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aplicacion_sem2/presentation/bloc/task_bloc.dart';
import 'package:aplicacion_sem2/presentation/bloc/task_event.dart';
import 'package:aplicacion_sem2/presentation/bloc/task_state.dart';
import 'package:aplicacion_sem2/domain/entities/Tasks.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gestión de Tareas")),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is TaskLoaded) {
            return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  trailing: Checkbox(
                    value: task.completed,
                    onChanged: (value) {
                      context.read<TaskBloc>().add(
                        UpdateTask(Task(
                          id: task.id,
                          title: task.title,
                          description: task.description,
                          completed: value ?? false,
                        )),
                      );
                    },
                  ),
                  onLongPress: () {
                    context.read<TaskBloc>().add(DeleteTaskEvent(task.id));
                  },
                );
              },
            );
          } else {
            return Center(child: Text("No hay tareas"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Nueva Tarea"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Título"),
              ),
              TextField(
                controller: descController,
                decoration: InputDecoration(labelText: "Descripción"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                final task = Task(
                  id: DateTime.now().toString(),
                  title: titleController.text,
                  description: descController.text,
                  completed: false,
                );
                context.read<TaskBloc>().add(AddTasks(task));
                Navigator.pop(context);
              },
              child: Text("Agregar"),
            ),
          ],
        );
      },
    );
  }
}
