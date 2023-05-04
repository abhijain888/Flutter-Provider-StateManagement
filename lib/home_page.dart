import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management/users_list_controller.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UsersListController>(
        context,
        listen: false,
      ).getUsersList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Users List"),
      ),
      body: Consumer<UsersListController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () async => controller.getUsersList(),
            child: ListView.builder(
              itemCount: controller.usersList.length,
              itemBuilder: (context, index) {
                var user = controller.usersList[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(user.id.toString()),
                  ),
                  title: Text(user.name ?? ""),
                  subtitle: Text(user.address?.city ?? ""),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
