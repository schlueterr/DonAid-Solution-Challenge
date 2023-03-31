import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  void _logout(BuildContext context) async {
    final currentUser = await ParseUser.currentUser();
    if (currentUser != null) {
      try {
        await currentUser.logout();
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      } catch (e) {
        // Error occurred during logout
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<ParseUser>(
          future: ParseUs  er.currentUser(
            include: ['email'],
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            final currentUser = snapshot.data;
            if (currentUser != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Username: ${currentUser.username}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Email: ${currentUser.email ?? "N/A"}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              );
            } else {
              return Text('No user logged in');
            }
          },
        ),
      ),
    );
  }
}
