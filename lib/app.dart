import 'package:demo1/screens/Users/users.dart';
import 'package:flutter/material.dart';
import 'screens/user_detail/user_detail.dart';
import 'style.dart';

const UsersRoute = '/';
const UserDetailRoute = '/user_detail';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _routes(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: AppBarTextStyle, // Correct modern property
        ),
        textTheme: TextTheme(
          titleLarge: TitleTextStyle, // Correct modern property
          bodyMedium: Body1TextStyle, // Correct modern property
        ),
      ),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final arguments = settings.arguments as Map<String, dynamic>?; // Type-check arguments
      Widget screen;

      switch (settings.name) {
        case UsersRoute:
          screen = Users(); // Fixed syntax
          break;
        case UserDetailRoute:
          if (arguments != null && arguments.containsKey('id')) {
            screen = UserDetail(arguments['id']);
          } else {
            screen = ErrorScreen('Invalid arguments for UserDetail'); // Fallback for invalid arguments
          }
          break;
        default:
          screen = ErrorScreen('Route not found'); // Fallback for unknown routes
      }

      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}

class ErrorScreen extends StatelessWidget {
  final String message;
  ErrorScreen(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
