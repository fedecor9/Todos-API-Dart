import 'package:dart_frog/dart_frog.dart';
import 'package:todos/data_sources/todos_data_source.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _onGet(context, int.parse(id));
    case HttpMethod.delete:
      return _onDelete(context, int.parse(id));

    case HttpMethod.put:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.post:
  }
  return _onGet(context, int.parse(id));
}

Future<Response> _onGet(RequestContext context, int id) async {
  final todosDataSource = context.read<TodosDataSource>();
  final todos = await todosDataSource.getTodoById(id: id);
  return Response.json(body: todos);
}

Future<Response> _onDelete(RequestContext context, int id) async {
  final todosDataSource = context.read<TodosDataSource>();
  await todosDataSource.delete(id: id);
  return Response(body: 'Todo $id deleted');
}
