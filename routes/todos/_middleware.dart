import 'package:dart_frog/dart_frog.dart';

import 'package:todos/data_sources/in_memory_todos_data_source.dart';
import 'package:todos/data_sources/todos_data_source.dart';

final _dataSource = InMemoryTodosDataSource();

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<TodosDataSource>((_) => _dataSource));
}
