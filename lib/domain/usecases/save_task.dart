import 'package:aplicacion_sem2/domain/entities/Tasks.dart';
import 'package:aplicacion_sem2/domain/repositories/tasks_repository.dart';

class SaveTask {
  final TasksRepository repository;

  SaveTask(this.repository);

  Future<void> execute(Task task) async {
    await repository.saveTask(task);
  }
}
