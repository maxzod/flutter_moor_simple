import 'package:moor_flutter/moor_flutter.dart';
import 'package:tasker/db/tasks.dart';
import 'package:tasker/db/tasks_dao.dart';

part 'tasks_database.g.dart';

@UseMoor(tables: [Tasks] ,daos: [TaskDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 2;

}
