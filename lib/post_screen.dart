import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import './new_homescreen.dart';
import 'post.dart';
// import 'package:back4app_sdk/back4app_sdk.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
//FILE NOT USED

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String _postType = '';

  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _content = '';

  void _selectPostType(String postType) {
    setState(() {
      _postType = postType;
    });

  Future<void> savePost(String title, String content) async {
    final todo = ParseObject('Todo')
      ..set('title', title)
      ..set('content', content);
      await todo.save();
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New $_postType Post'),
          content: Material(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter a title',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _title = value ?? '';
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter some content',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some content';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _content = value ?? '';
                    },
                    maxLines: 10,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // ParseObject post = new ParseObject("post");
                  // //store an object
                  // post.set("title",_title);
                  // post.set("content", _content);

                  // post.saveInStorage(new SaveCallback());

                  // final parseObject = ParseObject('post');
                  // parseObject.set<String>('title', _title);
                  // parseObject.set<String>('content', _content);
                  // parseObject.save();


                  final parseObject = ParseObject('post')
                ..set<String>('title', _title)
                ..set<String>('content', _content)
                ..set<String>('type', 'temp type');

                parseObject.save().then((response) {
                  if (response.success) {
                    print('saved post');
                  } else {
                    print('did not save post');// There was a problem, check response.error.message
                  }
                });
                  
                  // Create a new post object with the entered data
                  final post = Post(title: _title, content: _content);
                  // Navigate to the home screen and pass the post object
                  Navigator.pushReplacementNamed(context, '/home',
                      arguments: post);
                }
              },
              child: const Text('Post'),
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
        title: const Text('New Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                _selectPostType('Donate');
              },
              child: const Text('Donate Post'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _selectPostType('Request');
              },
              child: const Text('Request Post'),
            ),
          ],
        ),
      ),
    );
  }
}
