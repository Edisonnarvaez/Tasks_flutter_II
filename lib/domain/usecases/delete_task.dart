import 'package:aplicacion_sem2/domain/repositories/tasks_repository.dart';

class DeleteTask {
  final TasksRepository repository;

  DeleteTask(this.repository);

  Future<void> execute(String id) async {
    await repository.deleteTask(id);
  }
}
