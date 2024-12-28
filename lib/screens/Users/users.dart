import 'package:flutter/material.dart';
import '../../app.dart';
import '../../models/user.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final List<User> users = User.fetchAll();
  List<User> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    filteredUsers = users; // Initially show all users
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                //  labelText: 'Search',
                hintText: 'Search users by name',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.cancel),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onChanged: (value) => _filterUsers(value),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: TextButton(
          //     onPressed: () => _on(),
          //     child: Text('click'),
              
          //   ),
            
          // ),
          Expanded(
            child: ListView(
              children: filteredUsers
                  .map((user) => GestureDetector(
                        onTap: () => _onUserClick(context, user.id),
                        child: Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          elevation: 4.0, // Shadow effect
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(user.imagePath),
                                  radius: 40.0,
                                ),
                                SizedBox(width: 32.0),
                                Text(
                                  user.name,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _filterUsers(String query) {
    final filtered = users
        .where((user) => user.name
            .toLowerCase()
            .contains(query.toLowerCase())) // Filter logic
        .toList();
    setState(() {
      filteredUsers = filtered;
    });
  }

  void _onUserClick(BuildContext context, int userId) {
    print('${userId} is clicked');
    Navigator.pushNamed(context, UserDetailRoute, arguments: {"id": userId});
  }

  // void _on() {
  //   print("object");
  // }
}
