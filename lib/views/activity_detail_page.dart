import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/activity_detail_cubit.dart';
import 'package:to_do_app/cubit/homepage_cubit.dart';
import 'package:to_do_app/entity/activity.dart';

class ActivityDetailPage extends StatefulWidget {
  Activity activity;

  ActivityDetailPage({required this.activity});

  @override
  _ActivityDetailPageState createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  var tfActivityName = TextEditingController();

  Future<void> update(int activity_id, String activity_name) async {
    print("Update activity: $activity_id $activity_name");
  }

  @override
  void initState() {
    super.initState();
    var activity = widget.activity;
    tfActivityName.text = activity.activity_name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activity Detail Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfActivityName,
                decoration: const InputDecoration(
                  hintText: "Activity Name",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<ActivityDetailCubit>()
                      .update(widget.activity.activity_id, tfActivityName.text);
                },
                child: const Text("UPDATE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
