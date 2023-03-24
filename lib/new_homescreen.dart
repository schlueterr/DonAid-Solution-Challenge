import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class NewHomeScreen extends StatelessWidget {
  const NewHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // You can add your scrolling feed here
          // For example, you can use a ListView widget:
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: ListTile(
                  title: Text('Feed item ${index + 1}'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


// class NewHomeScreen extends StatelessWidget {
//   const NewHomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // You can add your scrolling feed here
//           // For example, you can use a ListView widget:
//           ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: 20,
//             itemBuilder: (BuildContext context, int index) {
//               return ListTile(
//                 title: Text('Feed item ${index + 1}'),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }