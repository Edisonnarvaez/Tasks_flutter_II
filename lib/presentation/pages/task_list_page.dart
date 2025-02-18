import 'package:aplicacion_sem2/domain/entities/Tasks.dart';
import 'package:aplicacion_sem2/presentation/bloc/task_bloc.dart';
import 'package:aplicacion_sem2/presentation/bloc/task_event.dart';
import 'package:aplicacion_sem2/presentation/bloc/task_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TaskError) {
            return Center(child: Text(state.message));
          }
          if (state is TaskLoaded) {
            return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text('\${task.description}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<TaskBloc>().add(
                            DeleteTaskEvent(task.id),
                          );
                    },
                  ),
                );
              },
            );
          }
          return const Center(child: Text('No tasks'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final task = Task(
            id: const Uuid().v4(),
            title: 'New Task Title',
            description: "New Task Description",
            completed: false,
          );
          context.read<TaskBloc>().add(AddTasks(task));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
