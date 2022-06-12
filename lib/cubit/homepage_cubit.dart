import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/entity/activity.dart';
import 'package:to_do_app/repo/activitydao_repository.dart';

class HomePageCubit extends Cubit<List<Activity>> {
  HomePageCubit() : super(<Activity>[]);

  var arepo = ActivityDaoRepository();

  Future<void> uploadActivities() async {
    var activityList = await arepo.getAllActivities();
    emit(activityList);
  }

  Future<void> search(String keyword) async {
    var liste = await arepo.searchActivity(keyword);
    emit(liste);
  }

  Future<void> delete(int activity_id) async {
    await arepo.deleteActivity(activity_id);
    await uploadActivities();
  }
}
