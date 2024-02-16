import 'package:app_to_do/features/data/models/task_model.dart';
import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final int id;
  final String title;
  final DateTime? dueDate;
  final bool isDone;

  @override
  List<Object?> get props => [id, title, dueDate, isDone];

  const TaskEntity({
    required this.id,
    required this.title,
    this.dueDate,
    this.isDone = false,
  });

  TaskModel toModel() => TaskModel(
        id: id,
        title: title,
        dueDate: dueDate,
        isDone: isDone,
      );

  TaskEntity copyWith({
    int? id,
    String? title,
    DateTime? dueDate,
    bool? isDone,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      dueDate: dueDate ?? this.dueDate,
      isDone: isDone ?? this.isDone,
    );
  }
}
