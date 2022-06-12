import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/homepage_cubit.dart';
import 'package:to_do_app/entity/activity.dart';
import 'package:to_do_app/views/activity_detail_page.dart';
import 'package:to_do_app/views/activity_record_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool searching = false;

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().uploadActivities();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searching
            ? TextField(
          decoration: const InputDecoration(hintText: "Search"),
          onChanged: (s) {
            context.read<HomePageCubit>().search(s);
          },
        )
            : const Text("To Do"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  searching = !searching;
                  context.read<HomePageCubit>().uploadActivities();
                });
              },
              icon: !searching
                  ? const Icon(Icons.search)
                  : const Icon(Icons.clear)),
        ],
      ),
      body: BlocBuilder<HomePageCubit, List<Activity>>(builder: (context, activities) {
        if(activities.isNotEmpty){
          return ListView.builder(itemCount: activities.length,
              itemBuilder:(context,index){
                var a = activities[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityDetailPage(activity: a,)))
                    .then((_){
                      context.read<HomePageCubit>().uploadActivities();
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("${a.activity_name}"),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Do you want to delete ${a.activity_name} ?"),
                                  action: SnackBarAction(
                                    label: "YES",
                                    onPressed: () {
                                      context
                                          .read<HomePageCubit>()
                                          .delete(a.activity_id);
                                    },
                                  ),
                                ));
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.black45,
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              } );
        }else{
          return const Center();
        }
      },),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ActivityRecordPage())).then((_) {
            context.read<HomePageCubit>().uploadActivities();
          });
        },
      ),
    );
  }
}
