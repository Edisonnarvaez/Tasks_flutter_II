import 'package:aplicacion_sem2/data/repositories/task_repository_impl.dart';
import 'package:aplicacion_sem2/domain/repositories/tasks_repository.dart';
import 'package:aplicacion_sem2/domain/usecases/delete_task.dart';
import 'package:aplicacion_sem2/domain/usecases/get_all_task.dart';
import 'package:aplicacion_sem2/domain/usecases/save_task.dart';
import 'package:aplicacion_sem2/presentation/bloc/task_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initializeDependencies() {
  // Repositories
  getIt.registerLazySingleton<TasksRepository>(
    () => TaskRepositoryImpl(),
  );

  // Use Cases
  getIt.registerLazySingleton(
    () => GetAllTasks(getIt<TasksRepository>()),
  );
  getIt.registerLazySingleton(
    () => SaveTask(getIt<TasksRepository>()),
  );
  getIt.registerLazySingleton(
    () => DeleteTask(getIt<TasksRepository>()),
  );

  // BLoCs
  getIt.registerFactory(
    () => TaskBloc(
      getAllTasks: getIt<GetAllTasks>(),
      saveTask: getIt<SaveTask>(),
      deleteTask: getIt<DeleteTask>(),
    ),
  );
}
