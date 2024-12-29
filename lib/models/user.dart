import 'user_users.dart';

class User {
  final int id;
  String name;
  String imagePath;
  final List<UserUsers> users;

  User(this.id, this.name, this.imagePath, this.users);

  static List<User> fetchAll() {
    return [
      User(1, 'Ahmed Saheel', 'assets/images/AhmedPicture.jpg', [
        UserUsers('Team Member',
            'New for Flutter SBI project team.\nJoined TCS - Nov 7 2024 \nCompleted Training : December 20  and joined in project on Dec 26'),
      ]),
   
      User(2, 'Anu', 'assets/images/profileWomen.png', [
        UserUsers('Team Member',
            'New for Flutter SBI project team.\nJoined TCS - Nov 7 2024 \nCompleted Training : December 20  and joined in project on Dec 26'),
      ]),
      User(3, 'Ahmed Saheel', 'assets/images/AhmedPicture.jpg', [
        UserUsers('Team Member',
            'New for Flutter SBI project team.\nJoined TCS - Nov 7 2024 \nCompleted Training : December 20  and joined in project on Dec 26'),
      ]),
   
      User(4, 'Anu', 'assets/images/profileWomen.png', [
        UserUsers('Team Member',
            'New for Flutter SBI project team.\nJoined TCS - Nov 7 2024 \nCompleted Training : December 20  and joined in project on Dec 26'),
      ]),
       User(5, 'Mr.Bala', 'assets/images/profileMen.jpg', [
        UserUsers('Team Lead', 'Head of the project'),
       
      ]),
      User(6, 'Mr.suresh', 'assets/images/profileMen.jpg', [
         UserUsers('Team Lead', 'Head of the project'),
      ]),
    ];
  }

  static User? fetchByID(int userId) {
    List<User> users = User.fetchAll();

    for (var i = 0; i < users.length; i++) {
      if (userId == users[i].id) {
        return users[i];
      }
    }
    return null;
  }
}
