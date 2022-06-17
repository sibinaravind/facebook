import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/Widgets/profile_avatar.dart';
import 'package:facebook/config/palette.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';
import '../Models/models.dart';

class Stories extends StatelessWidget {
  Widget build(BuildContext context) {
    bool hasBorder = false;
    return Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
            scrollDirection: Axis.horizontal,
            itemCount: 1 + stories.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: _Storycard(isAddStory: true));
              }

              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: _Storycard());

              // return Container(
              //   height: 20.0,
              //   width: 20.0,
              //   color: Colors.red,
              //   margin: const EdgeInsets.all(2.0),
              // );
            }));
  }
}

class _Storycard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;

  const _Storycard(
      {Key key, this.isAddStory = false, this.currentUser, this.story})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
              gradient: Palette.storygradient,
              borderRadius: BorderRadius.circular(12.0)),
        ),
        Positioned(
            top: 8.0,
            left: 8.0,
            child: isAddStory
                ? Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 30.0,
                        onPressed: () => print('Add to Story'),
                        icon: const Icon(Icons.add)),
                  )
                : ProfileAvatar(
                    imageUrl: story.user.imageUrl, hasBorder: !story.isViewed)),
        Positioned(
            bottom: 8.0,
            left: 8.0,
            right: 8.0,
            child: Text(
              isAddStory ? 'Add to story' : story.user.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ))
      ],
    );
  }
}
