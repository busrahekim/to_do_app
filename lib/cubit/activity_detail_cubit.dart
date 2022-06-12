import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/repo/activitydao_repository.dart';

class ActivityDetailCubit extends Cubit<void> {
  ActivityDetailCubit() : super(0);
  var arepo = ActivityDaoRepository();

  Future<void> update(int activity_id, String activity_name) async {
    await arepo.updateActivity(activity_id, activity_name);
  }
}
