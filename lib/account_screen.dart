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


class AccountScreen extends StatelessWidget {
 const AccountScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context){
  return Scaffold(
    // appBar: AppBar(
    //   title: const Text('Account')
    //   ),
      body: Column(   
          children:<Widget>[
            Container(  
              margin: const EdgeInsets.all(20.0), 
              alignment: Alignment.centerLeft, 
              child: const Text("Name",style: TextStyle(fontSize:16),)
            ),  
            Row(
              children: [
                ElevatedButton(onPressed: () {  },
                child: const Text("Edit"))
              ],),
            Container(  
              margin: const EdgeInsets.all(20.0), 
              alignment: Alignment.centerLeft,  
              child: const Text("Email",style: TextStyle(fontSize:16),), 
            ),  
            Row(
              children: [
                ElevatedButton(onPressed: () {  },
                child: const Text("Edit"))
              ],),
            Container(  
              margin: const EdgeInsets.all(20.0),  
              alignment: Alignment.centerLeft, 
              child: const Text("Phone",style: TextStyle(fontSize:16),),  
            ),  
            Row(
              children: [
                ElevatedButton(onPressed: () {  },
                child: const Text("Edit"))
              ],),
            Container(  
              margin: const EdgeInsets.all(20.0),  
              alignment: Alignment.centerLeft, 
              child: const Text("Address",style: TextStyle(fontSize:16),),  
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () {  },
                child: const Text("Edit"))
              ],),
            Container(  
              margin: const EdgeInsets.all(20.0),
              alignment: Alignment.centerLeft,   
              // ignore: prefer_const_constructors
              child: const Text("Donor/Recipient",style: TextStyle(fontSize:16),),  
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () {  },
                child: const Text("Edit"))
              ],),  
          ]  
      ),  
    );   
 }
}