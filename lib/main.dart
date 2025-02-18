import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:aplicacion_sem2/injection.dart';
import 'package:aplicacion_sem2/presentation/bloc/task_bloc.dart';
import 'package:aplicacion_sem2/presentation/bloc/task_event.dart';
import 'package:aplicacion_sem2/presentation/pages/task_list_page.dart';
import 'package:aplicacion_sem2/presentation/pages/task_builder.dart';

void main() {
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejercicio semana 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      //home: BlocProvider(
      //  create: (context) => getIt<TaskBloc>()..add(LoadTasks()),
      //  child: const TaskListPage(),
      //),
      home:TaskScreen(),
    );
  }
}
