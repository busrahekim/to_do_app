import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/repo/activitydao_repository.dart';

class ActivityRecordCubit extends Cubit<void>{
  ActivityRecordCubit() : super(0);
  var arepo = ActivityDaoRepository();

  Future<void> record(String activity_name) async {
    await arepo.insertActivity(activity_name);
  }
}