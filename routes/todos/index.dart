import 'package:dart_frog/dart_frog.dart';
import 'package:todos/data_sources/todos_data_source.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _onGet(context);
    case HttpMethod.post:
      final json = await context.request.json() as Map<String, dynamic>;
      return _onPost(
        context,
        json['title'] as String,
        json['description'] as String,
      );
    // ignore: no_default_cases
    default:
  }
  return _onGet(context);
}

Future<Response> _onGet(RequestContext context) async {
  final todosDataSource = context.read<TodosDataSource>();
  final todos = await todosDataSource.getAllTodos();
  return Response.json(body: todos);
}

Future<Response> _onPost(
  RequestContext context,
  String title,
  String description,
) async {
  final todosDataSource = context.read<TodosDataSource>();
  final newTodo =
      await todosDataSource.createTodo(title: title, description: description);
  return Response.json(body: newTodo);
}
