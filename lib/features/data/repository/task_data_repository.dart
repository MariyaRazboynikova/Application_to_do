import 'dart:async';
import 'package:app_to_do/features/data/models/task_model.dart';
import 'package:app_to_do/features/domain/entity/task_entity.dart';
import 'package:app_to_do/features/domain/repository/task_repository.dart';
import 'package:hive/hive.dart';

class TaskRepositoryImpl extends TaskRepository {
  @override
  Future<void> addTask(TaskEntity newTask) async {
    final storage = await Hive.openBox<TaskModel>('tasks');
    await storage.put(newTask.id, newTask.toModel());
  }

  @override
  Future<List<TaskEntity>> getTasksList() async {
    final storage = await Hive.openBox<TaskModel>('tasks');
    final tasksList = storage.values.map((task) => task.toEntity()).toList();
    unawaited(storage.close());
    return tasksList;
  }

  @override
  Future<void> deleteTask(int id) async {
    final storage = await Hive.openBox<TaskModel>('tasks');
    await storage.delete(id);
    unawaited(storage.close());
  }

  @override
  Future<void> toggleTaskStatus(int id) async {
    final storage = await Hive.openBox<TaskModel>('tasks');
    final task = storage.get(id);
    if (task != null) {
      final updatedTask = task.copyWith(isDone: !task.isDone);
      await storage.put(id, updatedTask);
    }
    unawaited(storage.close());
  }
}
