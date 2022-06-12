import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/activity_detail_cubit.dart';
import 'package:to_do_app/cubit/activity_record_cubit.dart';
import 'package:to_do_app/cubit/homepage_cubit.dart';
import 'package:to_do_app/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ActivityRecordCubit()),
        BlocProvider(create: (context) => ActivityDetailCubit()),
        BlocProvider(create: (context) => HomePageCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
