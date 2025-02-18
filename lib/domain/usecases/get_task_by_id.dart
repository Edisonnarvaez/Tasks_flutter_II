import 'package:aplicacion_sem2/domain/entities/Tasks.dart';
import 'package:aplicacion_sem2/domain/repositories/tasks_repository.dart';

class GetTaskById {
  final TasksRepository repository;

  GetTaskById(this.repository);

  Future<Task> execute(String id) async {
    return await repository.getTaskById(id);
  }
}
