import 'package:aplicacion_sem2/domain/entities/Tasks.dart';
import 'package:aplicacion_sem2/domain/repositories/tasks_repository.dart';

class TaskRepositoryImpl implements TasksRepository {
  final List<Task> _tasks = [];

  @override
  Future<List<Task>> getAllTasks() async {
    // Simulando delay de red
    await Future.delayed(const Duration(milliseconds: 500));
    return _tasks;
  }

  @override
  Future<Task> getTaskById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _tasks.firstWhere(
      (task) => task.id == id,
      orElse: () => throw Exception('task not found'),
    );
  }

  @override
  Future<void> saveTask(Task task) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _tasks.indexWhere((p) => p.id == task.id);
    if (index >= 0) {
      _tasks[index] = task;
    } else {
      _tasks.add(task);
    }
  }

  @override
  Future<void> deleteTask(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _tasks.removeWhere((task) => task.id == id);
  }
}
