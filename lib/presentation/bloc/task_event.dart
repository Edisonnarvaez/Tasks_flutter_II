import 'package:aplicacion_sem2/domain/entities/Tasks.dart';

abstract class TaskEvent {}

class LoadTasks extends TaskEvent {}

class AddTasks extends TaskEvent {
  final Task task;
  AddTasks(this.task);
}

class DeleteTaskEvent extends TaskEvent {
  final String id;
  DeleteTaskEvent(this.id);
}

class UpdateTaskEvent extends TaskEvent {
  final Task task;
  UpdateTaskEvent(this.task);
}

class UpdateTask extends TaskEvent {
  final Task task;

  UpdateTask(this.task);
}