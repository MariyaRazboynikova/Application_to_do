// ignore_for_file: overridden_fields, annotate_overrides

import 'package:app_to_do/features/domain/entity/task_entity.dart';
import 'package:hive_flutter/adapters.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends TaskEntity {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final DateTime? dueDate;

  @HiveField(3)
  final bool isDone;

  const TaskModel({
    required this.id,
    required this.title,
    this.dueDate,
    this.isDone = false,
  }) : super(
          id: id,
          title: title,
          dueDate: dueDate,
          isDone: isDone,
        );

  @override
  TaskModel copyWith({
    int? id,
    String? title,
    DateTime? dueDate,
    bool? isDone,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      dueDate: dueDate ?? this.dueDate,
      isDone: isDone ?? this.isDone,
    );
  }

  TaskEntity toEntity() => TaskEntity(
        id: id,
        title: title,
        dueDate: dueDate,
        isDone: isDone,
      );
}
