import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> listTasks() async {
  List tasks = [];
  CollectionReference taskCollection = db.collection('tasks');
  QuerySnapshot taskQuery = await taskCollection.get();
  taskQuery.docs.forEach((document) {
    tasks.add(document.data());
  });
  return tasks;
}

Future<void> saveTask(String name) async {
  await db.collection("tasks").add({"name": name});
}
