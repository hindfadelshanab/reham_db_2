
part 'task_model.dart';
import 'datebase_helpeer.dart';

class ProviderDatabase extends Ch {
  List<Task> dataList = List();

  Future getDataList() async {
    List<Task> newDataList = List();
    await DBHelper.myDatabase
        .getAllTask()
        .then((value) => value.forEach((element) {
      newDataList.add(Task.fromMap(element));
    }))
         
  }
  updateTask(Task taskModel) async {
    await Database.myDatabase
        .updateTask(taskModel)
        .whenComplete(() => this.notifyListeners())
        .whenComplete(() => getDataList());
  }

  deleteTask(int id) async {
    await Database.myDatabase.deleteTask(id);
    getDataList();
  }

  Future insertTask(Task task) async {
    await Database.myDatabase.insertTask(task);
    getDataList();
  }
}