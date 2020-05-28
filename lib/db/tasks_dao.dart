// Denote which tables this DAO can access
import 'package:moor_flutter/moor_flutter.dart';
import 'package:tasker/db/tasks.dart';
import 'package:tasker/db/tasks_database.dart';

part 'tasks_dao.g.dart';

@UseDao(tables: [Tasks])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  TaskDao(this.db) : super(db);

  // All tables have getters in the generated class - we can select the tasks table
  Future<List<Task>> getAllTasks() => select(tasks).get();

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<Task>> watchAllTasks() {
    return (select(tasks)
          // Statements like orderBy and where return void => the need to use a cascading ".." operator
          ..orderBy(
            ([
              // Primary sorting by due date
              (t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc),
              // Secondary alphabetical sorting
            ]),
          ))
        // watch the whole select statement
        .watch();
  }

  Future insertTask(Task task) => into(tasks).insert(task);

  // Updates a Task with a matching primary key
  Future updateTask(Task task) => update(tasks).replace(task);

  Future deleteTask(Task task) => delete(tasks).delete(task);
}
