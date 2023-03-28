import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> posts = [];

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  String dropdownValue = 'Donate';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(posts[index]['title']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(posts[index]['content']),
                        Text('Type: ${posts[index]['type']}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Enter a title',
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _contentController,
                  decoration: InputDecoration(
                    hintText: 'Enter a content',
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Donate', 'Receive']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          posts.add({
                            'title': _titleController.text,
                            'content': _contentController.text,
                            'type': dropdownValue,
                          });
                          _titleController.clear();
                          _contentController.clear();
                        });
                      },
                      child: Text('Add Post'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class NewHomeScreen extends StatefulWidget {
//   const NewHomeScreen({Key? key}) : super(key: key);

//   @override
//   _NewHomeScreenState createState() => _NewHomeScreenState();
// }

// class _NewHomeScreenState extends State<NewHomeScreen> {
//   List<Post> _posts = [];

//   void _addPost(Post post) {
//     setState(() {
//       _posts.add(post);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Feed'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // You can add your scrolling feed here
//             // For example, you can use a ListView widget:
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: _posts.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.grey,
//                       width: 1.0,
//                     ),
//                   ),
//                   child: ListTile(
//                     title: Text(_posts[index].title),
//                     subtitle: Text(_posts[index].content),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pushNamed(context, '/post').then((post) {
//             if (post != null) {
//               _addPost(post as Post);
//             }
//           });
//         },
//         tooltip: 'New Post',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }



// class NewHomeScreen extends StatefulWidget {
//   const NewHomeScreen({Key? key}) : super(key: key);

//   @override
//   _NewHomeScreenState createState() => _NewHomeScreenState();
// }

// class _NewHomeScreenState extends State<NewHomeScreen> {
//   List<Post> _posts = [];

//   void _addPost(Post post) {
//     setState(() {
//       _posts.add(post);
//     });
//   }

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
//             itemCount: _posts.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.grey,
//                     width: 1.0,
//                   ),
//                 ),
//                 child: ListTile(
//                   title: Text(_posts[index].title),
//                   subtitle: Text(_posts[index].content),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';



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
//               return Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.grey,
//                     width: 1.0,
//                   ),
//                 ),
//                 child: ListTile(
//                   title: Text('Feed item ${index + 1}'),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }


// }