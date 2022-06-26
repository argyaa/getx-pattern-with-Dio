import 'package:first_get_cli/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All User'),
        centerTitle: true,
      ),
      body: controller.obx((state) {
        return ListView.builder(
            itemCount: state!.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(state[index].avatar!)),
                title: Text(state[index].firstName!),
              );
            });
      },
          onLoading: const Center(child: CircularProgressIndicator()),
          onEmpty: const Center(
            child: Text("No Data"),
          )),
    );
  }
}
