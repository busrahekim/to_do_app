import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/activity_record_cubit.dart';

class ActivityRecordPage extends StatefulWidget {
  const ActivityRecordPage({Key? key}) : super(key: key);

  @override
  _ActivityRecordPageState createState() => _ActivityRecordPageState();
}

class _ActivityRecordPageState extends State<ActivityRecordPage> {

  var tfactivityName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activity Record"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfactivityName,
                decoration: const InputDecoration(
                  hintText: "Activity Name",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<ActivityRecordCubit>()
                      .record(tfactivityName.text);
                },
                child: const Text("SAVE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
