import 'dart:math';

import 'package:collection/collection.dart';
import 'package:todos/data_sources/todos_data_source.dart';
import 'package:todos/models/todos.dart';

/// todos data source in memory implementation
class InMemoryTodosDataSource extends TodosDataSource {
  ///List of [Todos]
  final List<Todos> _todos = Iterable.generate(
    10,
    (index) {
      final todo =
          _createTodo(description: 'description_$index', title: 'title$index');
      return todo;
    },
  ).toList();

  @override
  Future<List<Todos>> getAllTodos() async => _todos;

  @override
  Future<Todos?> getTodoById({required int id}) async =>
      _todos.firstWhereOrNull((element) => element.id == id);

  @override
  Future<Todos?> updateTodo({required int id, required bool isDone}) async =>
      _todos
          .firstWhereOrNull((element) => element.id == id)
          ?.copyWith(isDone: isDone);

  @override
  Future<void> delete({required int id}) async {
    _todos.removeWhere((element) => element.id == id);
  }

  @override
  Future<Todos> createTodo({
    required String title,
    required String description,
  }) async {
    final newTodo = _createTodo(title: title, description: description);
    _todos.add(newTodo);
    return newTodo;
  }
}

Todos _createTodo({required String title, required String description}) {
  return Todos(
    id: Random().nextInt(pow(2, 32).toInt()),
    title: title,
    description: description,
    isDone: Random().nextBool(),
  );
}
