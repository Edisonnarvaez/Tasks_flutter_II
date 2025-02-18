import 'package:aplicacion_sem2/domain/entities/Tasks.dart';
import 'package:aplicacion_sem2/domain/usecases/delete_task.dart';
import 'package:aplicacion_sem2/domain/usecases/get_all_task.dart';
import 'package:aplicacion_sem2/domain/usecases/save_task.dart';
import 'package:aplicacion_sem2/presentation/bloc/task_event.dart';
import 'package:aplicacion_sem2/presentation/bloc/task_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetAllTasks getAllTasks;
  final SaveTask saveTask;
  final DeleteTask deleteTask;

  TaskBloc({
    required this.getAllTasks,
    required this.saveTask,
    required this.deleteTask,
  }) : super(TaskInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTasks>(_onAddTask);
    on<DeleteTaskEvent>(_onDeleteTask);
  }

  Future<void> _onLoadTasks(
    LoadTasks event,
    Emitter<TaskState> emit,
  ) async {
    emit(TaskLoading());
    try {
      final tasks = await getAllTasks.execute();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<void> _onAddTask(
    AddTasks event,
    Emitter<TaskState> emit,
  ) async {
    emit(TaskLoading());
    try {
      await saveTask.execute(event.task);
      final tasks = await getAllTasks.execute();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<void> _onDeleteTask(
    DeleteTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(TaskLoading());
    try {
      await deleteTask.execute(event.id);
      final tasks = await getAllTasks.execute();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<void> _onUpdateTask(
    UpdateTask event,
    Emitter<TaskState> emit,
  ) async {
    await saveTask.execute(event.task);
    final tasks = await getAllTasks.execute();
    emit(TaskLoaded(tasks));
  }
}


