// import 'package:flutter/material.dart';
// import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

// class AccountScreen extends StatelessWidget {
//   const AccountScreen({Key? key}) : super(key: key);

// void _logout(BuildContext context) async {
//   final currentUser = await ParseUser.currentUser();
//   if (currentUser != null) {
//     try {
//       await currentUser.logout();
//       Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
//     } catch (e) {
//       // Error occurred during logout
//       print(e);
//     }
//   }
// }

// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Account'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('This is the account screen'),
//             SizedBox(
//               height: 16,
//             ),
//             ElevatedButton(
//               child: const Text('Logout'),
//               onPressed: () => _logout(context),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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

  Future<String> returnUserName() async {
    ParseUser user = await ParseUser.currentUser();
    String username = user.get<String>('username') ?? '';
    return username;
  }

  Future<String> returnEmail() async {
    ParseUser user = await ParseUser.currentUser();
    String email = user.get<String>('email') ?? '';
    return email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Account')
      //   ),
      body: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          alignment: Alignment.center,
          child: FutureBuilder<String>(
            future: returnUserName(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Loading...');
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                String username = snapshot.data ?? '';
                return Text('Username: $username');
              }
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Edit"))
          ],
        ),
        Container(
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          alignment: Alignment.center,
          child: FutureBuilder<String>(
            future: returnEmail(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Loading...');
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                String email = snapshot.data ?? '';
                return Text('Email: $email');
              }
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Edit"))
          ],
        ),
        Container(
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          alignment: Alignment.center,
          child: const Text(
            "Phone: 123-456-7899",
            style: TextStyle(fontSize: 16),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Edit"))
          ],
        ),
        Container(
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          alignment: Alignment.center,
          child: const Text(
            "Address: 1234 Easy Street, Austin Tx, 71234",
            style: TextStyle(fontSize: 16),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Edit"))
          ],
        ),
        Container(
          margin:
              const EdgeInsets.only(top: 20.0), // adjust the value as needed
          child: ElevatedButton(
            child: const Text('Logout'),
            onPressed: () => _logout(context),
          ),
        ),

        // Container(
        //   margin: const EdgeInsets.all(20.0),
        //   alignment: Alignment.centerLeft,
        //   // ignore: prefer_const_constructors
        //   child: const Text(
        //     "Donor/Recipient",
        //     style: TextStyle(fontSize: 16),
        //   ),
        // ),
        // Row(
        //   children: [
        //     ElevatedButton(onPressed: () {}, child: const Text("Edit"))
        //   ],
        // ),
      ]),
    );
  }
}
