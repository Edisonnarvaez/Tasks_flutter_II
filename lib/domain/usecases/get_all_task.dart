import 'package:aplicacion_sem2/domain/entities/Tasks.dart';
import 'package:aplicacion_sem2/domain/repositories/tasks_repository.dart';

class GetAllTasks {
  final TasksRepository repository;

  GetAllTasks(this.repository);

  Future<List<Task>> execute() async {
    return await repository.getAllTasks();
  }
}
