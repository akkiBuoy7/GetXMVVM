import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../view_models/controller/home/home_view_model.dart';

class ListViewContainerWidget extends StatelessWidget {
  const ListViewContainerWidget({
    super.key,
    required this.homeViewModel,
  });

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: homeViewModel.userList.value.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title:
                    Text(homeViewModel.userList.value.data![index].firstName!),
                subtitle: Text(
                  homeViewModel.userList.value.data![index].email!,
                  style: TextStyle(color: Colors.lightGreen),
                ),
                leading: Image.network(
                    homeViewModel.userList.value.data![index].avatar!),
              ),
            ),
          );
        });
  }
}
