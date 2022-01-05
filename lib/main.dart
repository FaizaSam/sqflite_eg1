import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_eg/database_helper.dart';
import 'database_helper.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqflite Example'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () async {
              int i = await DatabaseHelper.instance.insert({
                DatabaseHelper.columnName: 'sam',
              });
              print('The inserted id is: $i');
            },
            child: Text('insert'),
            color: Colors.grey[400],
          ),
          FlatButton(
            onPressed: () async {
              List<Map<String, dynamic>> queryRows =
                  await DatabaseHelper.instance.queryAll();
              print(queryRows);
            },
            child: Text('query'),
            color: Colors.green,
          ),
          FlatButton(
            onPressed: () async {
              int updatedId = await DatabaseHelper.instance.update({
                DatabaseHelper.columnId: 2,
                DatabaseHelper.columnName: 'Mark'
              });
              print(updatedId);
            },
            child: Text('update'),
            color: Colors.blue[300],
          ),
          FlatButton(
            onPressed: () async {
              int rowsAffected = await DatabaseHelper.instance.delete(1);
              print(rowsAffected);
            },
            child: Text('delete'),
            color: Colors.red,
          ),
        ],
      )),
    );
  }
}
