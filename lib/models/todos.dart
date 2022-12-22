import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todos.g.dart';

/// {@template todos}
/// Todos description
/// {@endtemplate}
@JsonSerializable()
class Todos extends Equatable {
  /// {@macro todos}
  const Todos({
    required this.id,
    required this.title,
    required this.description,
    required this.isDone,
  });

  /// Creates a Todos from Json map
  factory Todos.fromJson(Map<String, dynamic> data) => _$TodosFromJson(data);

  /// A description for id
  final int id;

  /// A description for title
  final String title;

  /// A description for description
  final String description;

  /// A description for isDone
  final bool isDone;

  /// Creates a copy of the current Todos with property changes
  Todos copyWith({
    int? id,
    String? title,
    String? description,
    bool? isDone,
  }) {
    return Todos(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isDone,
      ];

  /// Creates a Json map from a Todos
  Map<String, dynamic> toJson() => _$TodosToJson(this);
}
