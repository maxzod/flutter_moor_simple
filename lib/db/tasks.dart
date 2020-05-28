import 'package:moor_flutter/moor_flutter.dart';

class Tasks extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 50)();


  BoolColumn get completed => boolean().withDefault(Constant(false))();
}

