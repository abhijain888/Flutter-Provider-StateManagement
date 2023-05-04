import 'package:flutter/material.dart';
import 'network_api.dart';
import 'user_model.dart';

class UsersListController extends ChangeNotifier {
  bool isLoading = true;
  List<UserModel> usersList = [];

  void getUsersList() async {
    isLoading = true;
    notifyListeners();
    usersList = await _fetchUsersList();
    isLoading = false;
    notifyListeners();
  }

  Future<List<UserModel>> _fetchUsersList() async {
    List response = await NetworkApi.getResponse(
      url: "https://jsonplaceholder.typicode.com/users",
    );
    return response.map((e) => UserModel.fromJson(e)).toList();
  }
}
