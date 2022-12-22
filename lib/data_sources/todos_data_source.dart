import 'package:todos/models/todos.dart';

/// Interface that defines all the methods for Todos data source
abstract class TodosDataSource {
  /// Returns the list of all the [Todos]
  Future<List<Todos>> getAllTodos();

  /// Returns a [Todos] based on the provided [id]
  /// Returns an empty [Todos] if the id doesn't exist
  Future<Todos?> getTodoById({required int id});

  /// Returns a [Todos] updated with the done property
  Future<Todos?> updateTodo({required int id, required bool isDone});

  /// Delete the [Todos] with the provided [id] if one exists.
  Future<void> delete({required int id});

  /// Creates a [Todos] based on the provided [title] and [description].
  Future<Todos> createTodo({
    required String title,
    required String description,
  });
}
