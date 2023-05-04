import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'users_list_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UsersListController>(
      create: (context) => UsersListController(),
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}
