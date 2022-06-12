import 'package:to_do_app/entity/activity.dart';
import 'package:to_do_app/sqlite/DBHelper.dart';

class ActivityDaoRepository {
  Future<List<Activity>> getAllActivities() async {
    var db = await DBHelper.accessToDB();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM Activities");

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Activity(
          activity_id: satir["activity_id"],
          activity_name: satir["activity_name"]);
    });
  }

  Future<List<Activity>> searchActivity(String keyword) async {
    var db = await DBHelper.accessToDB();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM Activities WHERE activity_name LIKE '%$keyword%'");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Activity(
          activity_id: satir["activity_id"],
          activity_name: satir["activity_name"]);
    });
  }

  Future<void> deleteActivity(int activity_id) async {
    var db = await DBHelper.accessToDB();
    await db.delete("Activities",
        where: "activity_id = ?", whereArgs: [activity_id]);
  }

  Future<void> insertActivity(String activity_name) async {
    var db = await DBHelper.accessToDB();
    var info = Map<String, dynamic>();
    info["activity_name"] = activity_name;
    await db.insert("Activities", info);
  }

  Future<void> updateActivity(int activity_id, String activity_name) async {
    var db = await DBHelper.accessToDB();
    var info = Map<String, dynamic>();
    info["activity_name"] = activity_name;
    await db.update("Activities", info,
        where: "activity_id = ?", whereArgs: [activity_id]);
  }
}
