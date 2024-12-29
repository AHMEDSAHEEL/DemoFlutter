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
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredUsers = users; // Initially show all users
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () => {print("clicked Msg")},
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              "On Progress",
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Users'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search users by name',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: _clearSearch,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onChanged: (value) => _filterUsers(value),
            ),
          ),
          Expanded(
            child: filteredUsers.isEmpty
                ? Center(
                    child: Text(
                      'No User found',
                      style: TextStyle(
                        fontSize: 36.0,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredUsers.length,
                    itemBuilder: (context, index) {
                      final user = filteredUsers[index];
                      return GestureDetector(
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
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _filterUsers(String query) {
    final List<User> filtered = users
        .where((user) => user.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredUsers = filtered;
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      filteredUsers = users;
    });
  }

  void _onUserClick(BuildContext context, int userId) {
    print('${userId} is clicked');
    Navigator.pushNamed(context, UserDetailRoute, arguments: {"id": userId});
  }
}



  // void _on() {
  //   print("object");
  // }
     // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: TextButton(
          //     onPressed: () => _on(),
          //     child: Text('click'),
              
          //   ),
            
          // ),

