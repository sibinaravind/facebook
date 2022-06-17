import 'package:facebook/Widgets/Widgets.dart';
import 'package:facebook/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:facebook/Models/models.dart';
import '../data/data.dart';

class Rooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
            scrollDirection: Axis.horizontal,
            itemCount: 1 + onlineUsers.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: _CreateRoomButton());
              }
              // final User user = onlineUsers[0];
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ProfileAvatar(
                    imageUrl: onlineUsers[index].imageUrl,
                    isActive: true,
                  ));

              // return Container(
              //   height: 20.0,
              //   width: 20.0,
              //   color: Colors.red,
              //   margin: const EdgeInsets.all(2.0),
              // );
            }));
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => print('Create Room'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.white,
      textColor: Palette.facebookblue,
      child: Row(
        children: [
          Icon(
            Icons.video_call,
            size: 35.0,
            color: Colors.red,
          ),
          const SizedBox(
            width: 4.0,
          ),
          Text(' Create \n Room'),
        ],
      ),
    );
  }
}
