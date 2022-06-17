import 'package:flutter/material.dart';
import 'package:facebook/Models/models.dart';
import 'package:facebook/Widgets/Widgets.dart';

import '../data/data.dart';

class CreatePostContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(children: [
        Row(children: [
          ProfileAvatar(imageUrl: currentUser.imageUrl),
          const SizedBox(width: 8.0),
          Expanded(
              child: TextField(
            decoration:
                InputDecoration.collapsed(hintText: 'what\'s on your mind ?'),
          ))
        ]),
        const Divider(height: 10.0, thickness: 0.5),
        Container(
            height: 40.0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                      label: Text(''),
                      onPressed: () => print('Live'),
                      icon: const Icon(
                        Icons.videocam,
                        color: Colors.red,
                      )),
                  const VerticalDivider(width: 8.0),
                  FlatButton.icon(
                      label: Text(''),
                      onPressed: () => print('Photo'),
                      icon: const Icon(Icons.photo_library, color: Colors.red)),
                  const VerticalDivider(width: 8.0),
                  FlatButton.icon(
                      label: Text(''),
                      onPressed: () => print('Room'),
                      icon: const Icon(
                        Icons.video_call,
                        color: Colors.purpleAccent,
                      )),
                ]))
      ]),
    );
  }
}
