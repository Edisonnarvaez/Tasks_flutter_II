import 'package:aplicacion_sem2/domain/entities/Tasks.dart';
import 'package:aplicacion_sem2/domain/usecases/delete_task.dart';

abstract class TasksRepository {
  Future<List<Task>> getAllTasks();
  Future<Task> getTaskById(String id);
  Future<void> saveTask(Task task);
  Future<void> deleteTask(String id);
}
