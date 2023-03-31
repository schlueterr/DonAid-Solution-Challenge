import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ParseObject> posts = [];

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  String dropdownValue = 'Donate';

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    final response = await ParseObject('post').getAll();
    if (response.success) {
      setState(() {
        posts = response.results!.cast<ParseObject>();
      });
    } else {
      print('Error fetching posts: ${response.error!.message}');
    }
  }

  Future<void> deletePost(ParseObject post) async {
    final response = await post.delete();
    if (response.success) {
      setState(() {
        posts.remove(post);
      });
    } else {
      print('Error deleting post: ${response.error!.message}');
    }
  }

  Future<String> returnUserName() async {
    ParseUser user = await ParseUser.currentUser();
    String username = user.get<String>('username') ?? '';
    return username;
  }

  Future<String> getUserName() async {
    ParseUser? currentUser = await ParseUser.currentUser();
    String? username = currentUser!.username;
    return username ?? ""; // return an empty string if username is null
  }

  void _showPostDetails(ParseObject post) {
    // Future<String> username = getUserName();
    // String? username = await getUserName();
    String username;
    bool usernameCheck = false;
    getUserName().then((String? username) {
      if (post.get<String>('username') == username) {
        usernameCheck = true;
      }
      print(username);
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(post.get<String>('title') ?? ''),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.get<String>('content') ?? ''),
                Text(
                  'Type: ${post.get<String>('type') ?? ''}',
                  style: TextStyle(
                    color: post.get<String>('type') == 'donate'
                        ? Colors.red
                        : Colors.blue,
                  ),
                ),
                Text('User Name: ${post.get<String>('username') ?? ''}'),
                Text('Email: ${post.get<String>('email') ?? ''}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
            if (usernameCheck)
              TextButton(
                onPressed: () async {
                  await deletePost(post);
                  Navigator.of(context).pop();
                },
                child: Text('Delete'),
              ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<String>(
          future: returnUserName(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Loading...');
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              String username = snapshot.data ?? '';
              return Text('Welcome, $username');
            }
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => _showPostDetails(posts[index]),
                  child: Card(
                    color: posts[index].get<String>('type') == 'Donate'
                        ? Colors.red[50]
                        : Colors.blue[50],
                    child: ListTile(
                      title: Text(posts[index].get<String>('title') ?? ''),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(posts[index].get<String>('content') ?? ''),
                          Text(
                            'Type: ${posts[index].get<String>('type') ?? ''}',
                            style: TextStyle(
                              color:
                                  posts[index].get<String>('type') == 'Donate'
                                      ? Colors.red
                                      : Colors.blue,
                            ),
                          ),
                          Text(
                              'User Name: ${posts[index].get<String>('username') ?? ''}')
                        ],
                      ),
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _contentController,
                  decoration: InputDecoration(
                    hintText: 'Enter a content',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
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
                        items: <String>['Donate', 'Request']
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
                      onPressed: () async {
                        ParseUser? currentUser = await ParseUser.currentUser();
                        String? username = currentUser!.username;
                        String? email = currentUser.emailAddress;
                        final parseObject = ParseObject('post')
                          ..set<String>('title', _titleController.text)
                          ..set<String>('content', _contentController.text)
                          ..set<String>('type', dropdownValue)
                          ..set<String>('username', username ?? '')
                          ..set<String>('email', email ?? '');

                        final response = await parseObject.save();
                        if (response.success) {
                          setState(() {
                            posts.add(parseObject);
                          });
                        } else {
                          print(
                              'Error saving post: ${response.error!.message}');
                        }

                        _titleController.clear();
                        _contentController.clear();
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
