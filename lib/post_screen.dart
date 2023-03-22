import 'package:flutter/material.dart';
import './new_homescreen.dart';

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
                  // You can now save the _title and _content variables to your database or send them to an API
                  //Navigator.pop(context); // This line will remove the dialog
                  // Navigator.pushReplacementNamed(context, '/home');
                  Navigator.pushReplacementNamed(context, '/home'); // This line will take you to the home screen
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