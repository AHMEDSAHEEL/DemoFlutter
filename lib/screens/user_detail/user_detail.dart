import 'package:demo1/screens/user_detail/image_banner.dart';
import 'package:demo1/screens/user_detail/text_section.dart';
import 'package:flutter/material.dart';
import '../../models/user.dart';

class UserDetail extends StatelessWidget {
  final int _userID;

  UserDetail(this._userID);

  @override
  Widget build(BuildContext context) {
    final user = User.fetchByID(_userID);
  
    return Scaffold(
        appBar: AppBar(
          title: Text(user!.name),
          backgroundColor: Colors.red,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageBanner(user.imagePath),
          ]..addAll(textSections(user)),
        ));
  }

  List<Widget> textSections(User users) {
    return users.users
        .map((user) => TextSection(user.title, user.text))
        .toList();
  }
}
